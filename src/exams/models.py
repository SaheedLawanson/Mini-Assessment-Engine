import datetime
from django.db import models

from courses.models import Course
from utility.mixins import AutoTimestampMixin


class Exam(AutoTimestampMixin, models.Model):
    title = models.CharField(max_length=200, null=True, blank=True)
    course = models.ForeignKey(Course, on_delete=models.PROTECT, related_name="exams")
    metadata = models.JSONField(null=True, blank=True)
    duration_minutes = models.PositiveIntegerField()
    is_published = models.BooleanField(default=False)
    year = models.SmallIntegerField(default=datetime.datetime.now().year)

    def __str__(self):
        return self.course.title + " - " + (self.title or "Exam")
