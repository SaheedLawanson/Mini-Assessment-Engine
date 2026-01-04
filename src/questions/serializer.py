from questions.models import Question
from rest_framework import serializers
from choice.serializer import ChoiceSerializer


class QuestionSerializer(serializers.ModelSerializer):
    choices = ChoiceSerializer(many=True, read_only=True)

    class Meta:
        model = Question
        fields = ['id', 'question_type', 'text', 'marks', 'position', 'choices']