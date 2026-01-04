from django.conf import settings
from django.db import models

from exams.models import Exam
from utility.mixins import AutoTimestampMixin


# Create your models here.
User = settings.AUTH_USER_MODEL

class Submission(AutoTimestampMixin, models.Model):
    NOT_STARTED = "NOT_STARTED"
    IN_PROGRESS = "IN_PROGRESS"
    SUBMITTED = "SUBMITTED"
    GRADED = "GRADED"

    STATUSES = [
        (NOT_STARTED, "Not Started"),
        (IN_PROGRESS, "In Progress"),
        (SUBMITTED, "Submitted"),
        (GRADED, "Graded"),
    ]

    exam = models.ForeignKey(
        Exam,
        on_delete=models.CASCADE,
        related_name="submissions"
    )
    student = models.ForeignKey(
        User,
        on_delete=models.CASCADE,
        related_name="exam_submissions"
    )
    started_at = models.DateTimeField()
    submitted_at = models.DateTimeField(blank=True, null=True)
    score = models.DecimalField(
        max_digits=6,
        decimal_places=2,
        null=True
    )
    status = models.CharField(
        max_length=20,
        choices=STATUSES,
        default=NOT_STARTED
    )

    class Meta:
        unique_together = ("exam", "student")

    def __str__(self):
        return f"{self.student} - {self.exam}"