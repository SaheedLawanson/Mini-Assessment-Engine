from rest_framework import serializers

from exams.models import Exam


class ExamSerializer(serializers.ModelSerializer):

    class Meta:
        model = Exam
        fields = [
            "id",
            "title",
            "course",
            "metadata",
            "duration_minutes",
            "is_published",
            "year",
        ]
