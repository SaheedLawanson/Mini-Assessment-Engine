from celery import shared_task
from decimal import Decimal
from django.db import transaction
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import cosine_similarity
from submissions.models import Submission
from answers.models import Answer
from questions.models import Question


@shared_task(bind=True)
def grade_submission(self, exam_id, student_id):
    try:
        with transaction.atomic():
            submission = Submission.objects.select_for_update().get(
                exam_id=exam_id,
                student_id=student_id,
                status=Submission.SUBMITTED
            )
            
            # Get all answers for this submission
            answers = Answer.objects.filter(
                submission=submission
            ).select_related('question', 'choice')
            
            total_score = Decimal('0.00')
            
            for answer in answers:
                question = answer.question
                
                # Grade MCQ questions
                if question.question_type == Question.MCQ:
                    if answer.choice and answer.choice.is_correct:
                        # Award full marks for correct answer
                        answer.marks_awarded = question.marks
                        total_score += question.marks
                    else:
                        # No marks for incorrect answer
                        answer.marks_awarded = Decimal('0.00')
                    answer.save()
                
                # Grade Theory questions (placeholder for now)
                elif question.question_type == Question.THEORY:
                    if answer.text and question.expected_answer:
                        # Use TF-IDF and cosine similarity to grade theory answers
                        vectorizer = TfidfVectorizer(lowercase=True, stop_words='english')
                        
                        try:
                            # Create TF-IDF vectors for both answers
                            tfidf_matrix = vectorizer.fit_transform([
                                question.expected_answer,
                                answer.text
                            ])
                            
                            # Calculate cosine similarity
                            similarity = cosine_similarity(tfidf_matrix[0:1], tfidf_matrix[1:2])[0][0]
                            
                            # Award marks based on similarity score
                            # similarity ranges from 0 to 1
                            answer.marks_awarded = Decimal(str(similarity)) * question.marks
                            total_score += answer.marks_awarded.quantize(Decimal('0.01'))
                        except ValueError:
                            # Handle case where text is too short or invalid
                            answer.marks_awarded = Decimal('0.00')
                    else:
                        # No answer provided
                        answer.marks_awarded = Decimal('0.00')
                    
                    answer.save()
            
            # Update submission score and status
            submission.score = total_score
            submission.status = Submission.GRADED
            submission.save()
        
        return f"Graded submission for exam {exam_id}, student {student_id} with score {total_score}"
        
    except Submission.DoesNotExist:
        return f"Submission for exam {exam_id}, student {student_id} not found"
    except Exception as e:
        return f"Error grading submission for exam {exam_id}, student {student_id}: {str(e)}"
    