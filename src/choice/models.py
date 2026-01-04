from django.db import models

# Create your models here.from django.db import models

from questions.models import Question
from django.conf import settings
from utility.mixins import AutoTimestampMixin

User = settings.AUTH_USER_MODEL


# Create your models here.
class Choice(AutoTimestampMixin, models.Model):
    question = models.ForeignKey(
        Question,
        on_delete=models.CASCADE,
        related_name="choices",
    )
    option = models.CharField(max_length=1)  # A, B, C, D, etc.
    text = models.TextField()
    is_correct = models.BooleanField(null=True)

    class Meta:
        unique_together = ("question", "option")

