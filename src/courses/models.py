from django.db import models

from utility.mixins import AutoTimestampMixin


class Course(AutoTimestampMixin, models.Model):
    title = models.CharField(max_length=200)
    code = models.CharField(max_length=50)

    def __str__(self):
        return f"{self.code} - {self.title}"