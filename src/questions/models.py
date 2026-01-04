from django.db import models

# Create your models here.
from django.db import models
from exams.models import Exam


class Question(models.Model):
    MCQ = "MCQ"
    THEORY = "THEORY"

    QUESTION_TYPES = [
        (MCQ, "Multiple Choice"),
        (THEORY, "Essay"),
    ]

    exam = models.ForeignKey(
        Exam,
        on_delete=models.CASCADE,
        related_name="questions",
    )
    question_type = models.CharField(choices=QUESTION_TYPES)
    text = models.TextField()
    expected_answer = models.TextField()
    marks = models.DecimalField(max_digits=5, decimal_places=2)
    position = models.PositiveIntegerField()

    class Meta:
        unique_together = ("position", "exam")
