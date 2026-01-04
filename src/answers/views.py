from django.shortcuts import get_object_or_404
from django.http import JsonResponse
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.pagination import LimitOffsetPagination
from django.http import HttpRequest
import json

from .models import Answer
from questions.models import Question
from choice.models import Choice
from submissions.models import Submission
from answers.serializer import AnswerSerializer
from questions.serializer import QuestionSerializer
from choice.serializer import ChoiceSerializer


@api_view(['POST'])
@permission_classes([IsAuthenticated])
def submit_answer(request: HttpRequest, question_id: int):
    question = get_object_or_404(Question, id=question_id)
    
    try:
        data = json.loads(request.body) if request.body else {}
    except json.JSONDecodeError:
        return JsonResponse({'error': 'Invalid Input'}, status=400)
    
    # Get the active submission for this exam
    submission = Submission.objects.filter(
        exam=question.exam,
        student=request.user,
        status=Submission.IN_PROGRESS
    ).first()
    
    if not submission:
        return JsonResponse({
            'error': 'Action Rejected: Exam has not been started or is no longer in progress'
        }, status=400)
    
    # Validate input based on question type
    if question.question_type == Question.MCQ:
        choice_id = data.get('choice_id')
        
        if not choice_id:
            return JsonResponse({
                'error': 'choice_id is required for MCQ questions'
            }, status=400)
        
        # Validate choice belongs to this question
        choice = get_object_or_404(Choice, id=choice_id, question=question)
        
        # Create or update answer
        answer, created = Answer.objects.update_or_create(
            question=question,
            submission=submission,
            defaults={
                'choice': choice,
                'text': None,
                'marks_awarded': None
            }
        )
        
        return JsonResponse({
            'message': 'Answer submitted successfully',
            'answer_id': answer.id,
            'question_id': question.id,
            'choice_id': choice.id,
            'created': created
        }, status=201 if created else 200)
    
    elif question.question_type == Question.THEORY:
        text = data.get('text')
        
        if not text:
            return JsonResponse({
                'error': 'text is required for Theory questions'
            }, status=400)
        
        # Create or update answer
        answer, created = Answer.objects.update_or_create(
            question=question,
            submission=submission,
            defaults={
                'text': text,
                'choice': None,
                'marks_awarded': None
            }
        )
        
        return JsonResponse({
            'message': 'Answer submitted successfully',
            'answer_id': answer.id,
            'question_id': question.id,
            'created': created
        }, status=201 if created else 200)
    
    return JsonResponse({
        'error': 'Invalid question type'
    }, status=400)


@api_view(['GET'])
@permission_classes([IsAuthenticated])
def get_exam_answers(request: HttpRequest, exam_id: int):
    # Get the submission for this exam
    submission = Submission.objects.filter(
        exam_id=exam_id,
        student=request.user,
        status__in=[Submission.IN_PROGRESS, Submission.SUBMITTED]
    ).first()
    
    if not submission:
        return JsonResponse({
            'error': 'No submission found for this exam'
        }, status=404)
    
    # Get all questions for this exam
    questions = Question.objects.filter(
        exam_id=exam_id
    ).prefetch_related('choices').order_by('position')
    
    # Get all answers for this submission as a dictionary
    answers = Answer.objects.filter(
        submission=submission.id
    ).select_related('question', 'choice')
    
    # Create a mapping of question_id to answer
    answer_map = {answer.question_id: answer for answer in answers}
    
    # Build response data with all questions
    questions_data = []
    for question in questions:
        question_dict = QuestionSerializer(question).data
        
        # Check if there's an answer for this question
        answer = answer_map.get(question.id)
        
        if answer:
            # Add answer data
            question_dict['answer'] = {
                'id': answer.id,
                'selected_choice': ChoiceSerializer(answer.choice).data if answer.choice else None,
                'text': answer.text,
                'marks_awarded': float(answer.marks_awarded) if answer.marks_awarded else None,
            }
        else:
            # No answer yet
            question_dict['answer'] = {
                'id': None,
                'selected_choice': None,
                'text': None,
                'marks_awarded': None,
            }
        
        questions_data.append(question_dict)
    
    # Apply pagination
    paginator = LimitOffsetPagination()
    paginated_questions = paginator.paginate_queryset(questions_data, request)
    
    # Return paginated response
    return paginator.get_paginated_response(paginated_questions)

