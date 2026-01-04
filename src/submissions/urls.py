from django.urls import path
from . import views

urlpatterns = [
    path('', views.get_submissions, name='get_submissions'),
    path('exams/<int:exam_id>/start/', views.start_exam, name='start_exam'),
    path('exams/<int:exam_id>/end/', views.end_exam, name='end_exam'),
]
