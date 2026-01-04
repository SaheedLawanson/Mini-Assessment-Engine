from django.urls import path
from . import views

urlpatterns = [
    path('questions/<int:question_id>/submit/', views.submit_answer, name='submit_answer'),
    path('exams/<int:exam_id>/', views.get_exam_answers, name='get_exam_answers'),
]
