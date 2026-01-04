from django.db import models

from choice.models import Choice
from questions.models import Question
from submissions.models import Submission
from utility.mixins import AutoTimestampMixin

# Create your models here.
class Answer(AutoTimestampMixin, models.Model):
    question = models.ForeignKey(
        Question,
        on_delete=models.CASCADE,
        related_name="answers"
    )
    submission = models.ForeignKey(
        Submission,
        on_delete=models.CASCADE,
        related_name="answers"
    )
    text = models.TextField(null=True)
    choice = models.ForeignKey(
        Choice,
        on_delete=models.SET_NULL,
        null=True
    )
    marks_awarded = models.DecimalField(
        max_digits=5,
        decimal_places=2,
        blank=True,
        null=True
    )

    class Meta:
        unique_together = ("submission", "question")

    def __str__(self):
        return f"Answer to Question {self.question_id}"