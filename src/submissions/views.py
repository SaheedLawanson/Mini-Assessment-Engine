from django.shortcuts import get_object_or_404
from django.http import JsonResponse
from django.utils import timezone
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.pagination import LimitOffsetPagination
from exams.models import Exam
from django.http import HttpRequest
from .models import Submission
from .tasks import grade_submission
from .serializers import SubmissionSerializer


@api_view(['POST'])
@permission_classes([IsAuthenticated])
def start_exam(request: HttpRequest, exam_id: int):
    """
    Start an exam by creating a submission record.
    """
    exam = get_object_or_404(Exam, id=exam_id, is_published=True)
    
    # Check if submission already exists
    existing_submission = Submission.objects.filter(
        exam=exam.id,
        student=request.user.id,
    ).first()
    
    if existing_submission:
        if existing_submission.status == Submission.SUBMITTED:
            return JsonResponse({
                'error': 'You have already submitted this exam'
            }, status=400)
        
        return JsonResponse({
            'message': 'Exam already started',
            'submission_id': existing_submission.id,
            'started_at': existing_submission.started_at.isoformat(),
            'status': existing_submission.status
        })
    
    # Create new submission
    submission = Submission.objects.create(
        exam=exam,
        student=request.user,
        started_at=timezone.now(),
        status=Submission.IN_PROGRESS
    )
    
    return JsonResponse({
        'message': 'Exam started successfully',
        'submission_id': submission.id,
        'started_at': submission.started_at.isoformat(),
        'status': submission.status,
        'duration_minutes': exam.duration_minutes
    }, status=201)


@api_view(['PUT'])
@permission_classes([IsAuthenticated])
def end_exam(request: HttpRequest, exam_id: int):
    """
    End an exam by updating the submission status to SUBMITTED.
    """
    submission = get_object_or_404(
        Submission,
        exam=exam_id,
        student=request.user,
        status=Submission.IN_PROGRESS
    )
    
    if submission.status == Submission.SUBMITTED:
        return JsonResponse({
            'error': 'Exam has already been submitted'
        }, status=400)
    
    if submission.status != Submission.IN_PROGRESS:
        return JsonResponse({
            'error': 'Exam is not in progress'
        }, status=400)
    
    # Update submission
    submission.status = Submission.SUBMITTED
    submission.submitted_at = timezone.now()
    submission.save()

    grade_submission.delay(exam_id, request.user.id)
    
    return JsonResponse({
        'message': 'Exam submitted successfully',
        'submission_id': submission.id,
        'started_at': submission.started_at.isoformat(),
        'submitted_at': submission.submitted_at.isoformat(),
        'status': submission.status
    })


@api_view(['GET'])
@permission_classes([IsAuthenticated])
def get_submissions(request: HttpRequest):
    """
    Get all submissions for the logged-in student.
    Optional query param: exam_id for filtering by specific exam
    """
    submissions = Submission.objects.filter(
        student=request.user.id
    ).select_related('exam', 'exam__course').order_by('-created_at')
    
    # Filter by exam_id if provided
    exam_id = request.GET.get('exam_id')
    if exam_id:
        submissions = submissions.filter(exam_id=exam_id)
    
    # Apply pagination
    paginator = LimitOffsetPagination()
    paginated_submissions = paginator.paginate_queryset(submissions, request)
    
    serializer = SubmissionSerializer(paginated_submissions, many=True)
    
    return paginator.get_paginated_response(serializer.data)


