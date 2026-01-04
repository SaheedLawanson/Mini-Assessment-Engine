from rest_framework import serializers
from submissions.models import Submission


class CourseSerializer(serializers.Serializer):
    code = serializers.CharField()
    title = serializers.CharField()


class ExamNestedSerializer(serializers.Serializer):
    id = serializers.IntegerField()
    title = serializers.CharField()
    course = CourseSerializer()


class SubmissionSerializer(serializers.ModelSerializer):
    exam = ExamNestedSerializer(read_only=True)
    
    class Meta:
        model = Submission
        fields = ['id', 'exam', 'status', 'started_at', 'submitted_at', 'score', 'created_at']
