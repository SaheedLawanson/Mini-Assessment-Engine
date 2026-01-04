from rest_framework import serializers
from .models import Answer
from questions.serializer import QuestionSerializer
from choice.serializer import ChoiceSerializer


class AnswerSerializer(serializers.ModelSerializer):
    question = QuestionSerializer(read_only=True)
    selected_choice = ChoiceSerializer(source='choice', read_only=True)
    
    class Meta:
        model = Answer
        fields = ['id', 'question', 'text', 'selected_choice', 'marks_awarded']
