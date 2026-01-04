# Acad AI - Mini Assessment Engine

A Django-based REST API that simulates core functionality of an academic assessment system, allowing students to take exams, submit answers, and receive automated grading feedback.

## Overview

This project implements a secure exam management system with:
- **Student authentication** and session management
- **Exam lifecycle management** (start, answer, submit)
- **Automated grading** using TF-IDF cosine similarity for theory questions
- **Background processing** with Celery for asynchronous grading
- **Optimized database queries** for efficient resource utilization

## Assessment Specification

This project was built to fulfill the following requirements:

### 1. Database Modeling
Designed a relational database schema representing:
- **Exams** – title, duration, course, metadata, year
- **Questions** – linked to exams, question type (MCQ/Theory), expected answers
- **Submissions** – student, exam, answers, timestamps, scores, and grades
- **Choices** – multiple choice options for MCQ questions
- Proper use of foreign keys, indexing, and normalization

### 2. Secure Student Submission Endpoint
- Token Authentication (Custom + Session Authentication)
- Students can only view and submit their own exam data
- Input validation and permission checks on all endpoints

### 3. Automated Grading Logic
**Mock Grading Service Implementation:**
- **MCQ Questions**: Direct validation against correct choice
- **Theory Questions**: TF-IDF vectorization with cosine similarity scoring
- Modular design for easy extension/replacement of grading algorithms
- Asynchronous processing using Celery task queue

### 4. Database Query Optimization
- `select_related()` for foreign key relationships
- `prefetch_related()` for reverse foreign keys and many-to-many
- Database transactions for data integrity during grading
- Row-level locking (`select_for_update`) to prevent race conditions

## Requirements

- **Docker** and **Docker Compose** (required)
- No other dependencies needed - everything runs in containers

## Quick Start

1. **Clone the repository**
```bash
git clone <repository-url>
cd acadai
```

2. **Configure environment variables**
```bash
cp .env.example .env
```

3. **Start the application**
```bash
docker-compose up
```

This single command will:
- Start PostgreSQL database
- Start Redis for Celery task queue
- Run Django migrations
- Seed the database with initial data
- Start the Django development server on `http://localhost:8000`
- Start the Celery worker for background grading

## Seeded Data

When you run the application, the following data is automatically seeded:

### Students (10)
- **Usernames**: `230501001` through `230501010` (UNILAG matriculation number format)
- **Password**: `password123` (all students)

### Admin User
- **Username**: `admin`
- **Password**: `Sweetlittlepassword21#`

### Course
- **Code**: FUN 420
- **Title**: Advanced Meme Theory and Internet Culture

### Exam
- **Title**: Final Examination - Advanced Meme Theory
- **Duration**: 120 minutes
- **Questions**: 10 MCQ + 5 Theory questions (15 total)

## API Documentation

Complete API documentation with detailed request/response examples, authentication requirements, and error responses is available in the **Postman Collection**:

📄 **[Acad AI.postman_collection.json](./Acad%20AI.postman_collection.json)**

### Quick Overview of Available Endpoints:

**Authentication**
- `POST /api/auth/login/` - Login and get authentication token
- `POST /api/auth/logout/` - Logout and invalidate token

**Exam Management**
- `POST /api/submissions/exams/<exam_id>/start/` - Start an exam
- `GET /api/questions/exams/<exam_id>/` - Get exam questions (supports `?type=MCQ` or `?type=THEORY`)
- `GET /api/answers/exams/<exam_id>/` - View exam progress and answers
- `PUT /api/submissions/exams/<exam_id>/end/` - Submit exam for grading

**Answer Submission**
- `POST /api/answers/questions/<question_id>/submit/` - Submit answer (MCQ: `choice_id`, Theory: `text`)

**Submissions**
- `GET /api/submissions/` - View all submissions (supports `?exam_id=<id>` filter)

### Usage

1. Import `Acad AI.postman_collection.json` into Postman
2. Use the **Login** request to get your authentication token
3. The token is automatically set in the collection variables
4. All subsequent requests will use the token automatically

## Exam Flow

1. **Login** as a student
2. **Start Exam** 
3. **Get Questions** (optionally filter by type)
4. **Answer Questions** one by one (MCQ or Theory)
5. **Check Progress** (optional)
6. **End Exam** to submit for grading
7. **View Results** after background grading completes

## Grading System

### MCQ Questions
- Direct validation against the correct choice
- Full marks if correct, 0 marks if incorrect

### Theory Questions
- Uses **TF-IDF (Term Frequency-Inverse Document Frequency)** vectorization
- Computes **cosine similarity** between student answer and expected answer
- Marks awarded proportionally to similarity score (0.0 to 1.0)
- Example: 80% similarity on a 10-mark question = 8 marks

### Background Processing
- Grading is handled asynchronously by Celery workers
- Submissions are queued immediately upon exam completion
- Database transactions ensure data integrity during grading
- Row-level locking prevents concurrent grading conflicts

## Architecture Highlights

### Database Optimizations
- **Select Related**: Used for one-to-one and foreign key relationships
  ```python
  Submission.objects.select_related('exam', 'exam__course')
  ```
- **Prefetch Related**: Used for reverse foreign keys
  ```python
  Question.objects.prefetch_related('choices')
  ```
- **Atomic Transactions**: Ensures all-or-nothing grading operations
- **Row Locking**: Prevents race conditions during concurrent access

### Security Features
- Token Authentication with session support
- Permission checks ensure students only access their own data
- Input validation on all endpoints
- CSRF protection for session authentication

### Code Structure
- Modular design with clear separation of concerns
- Serializers for consistent API responses
- Reusable utility mixins (AutoTimestampMixin)
- Task-based background processing

## Project Structure

```
acadai/
├── src/
│   ├── assessment_engine/    # Django project settings
│   ├── answers/              # Answer submission logic
│   ├── choice/               # MCQ choices/options
│   ├── courses/              # Course management
│   ├── exams/                # Exam configuration
│   ├── questions/            # Question management
│   ├── submissions/          # Submission & grading logic
│   ├── userauth/             # Custom authentication
│   └── utility/              # Shared utilities
├── docker-compose.yml        # Container orchestration
├── Dockerfile                # Application container
├── dump_file.sql            # Initial data seed
└── .env                     # Environment configuration
```

## Development

### Run Locally (without Docker)

If you prefer to run without Docker:

1. Install dependencies:
```bash
uv sync
```

2. Set up PostgreSQL and Redis locally

3. Update `.env` with local connection details

4. Run migrations:
```bash
cd src
uv run python manage.py migrate
```

5. Seed data:
```bash
uv run python manage.py seed_data
```

6. Start Django server:
```bash
uv run python manage.py runserver
```

7. Start Celery worker (separate terminal):
```bash
uv run celery -A assessment_engine worker -l INFO
```

## Improvements Made

### Implemented
- ✅ Optimized database queries with `select_related()` and `prefetch_related()`
- ✅ Transaction safety with atomic operations and row-level locking
- ✅ Paginated responses for large datasets
- ✅ Serializer-based API responses for consistency
- ✅ Background task processing with retry mechanisms
- ✅ Comprehensive endpoint for viewing exam progress
- ✅ Docker containerization for easy deployment

### Beyond Specification
- Added pagination support across all list endpoints
- Implemented progress tracking (students can view answers before ending exam)
- Built comprehensive seeding system for development/testing
- Added course-exam relationships for better data modeling
- Question positioning for ordered display
- Metadata field on exams for extensibility

## Future Improvements

Given more time, the following enhancements would be valuable:

### Authentication & Authorization
- **JWT Authentication**: Replace token auth with JWT for stateless authentication
- **Course Registration Check**: Validate student enrollment before allowing exam access
- **Role-based Permissions**: Implement instructor and student role separation
- **OAuth Integration**: Support social login (Google, Microsoft)

### Grading Enhancements
- **Multiple Grading Algorithms**: Support for keyword matching, NER-based grading
- **LLM Integration**: Optional AI-powered grading (OpenAI, Claude, Gemini)
- **Partial Credit**: More sophisticated scoring for theory questions
- **Rubric Support**: Allow instructors to define custom grading criteria

### Reliability & Performance
- **Dead Letter Queue (DLQ)**: Handle failed grading tasks gracefully
- **Retry Mechanism**: Automatic retry with exponential backoff
- **Caching Layer**: Redis caching for frequently accessed data
- **Read Replicas**: Scale database reads for high traffic
- **CDN Integration**: Serve static assets efficiently

### Features
- **Real-time Exam Monitoring**: WebSocket support for live exam status
- **Time Limits**: Automatic exam submission on timeout
- **Question Randomization**: Prevent cheating with shuffled questions
- **Bulk Import/Export**: CSV/Excel support for question management
- **Analytics Dashboard**: Exam performance metrics and insights
- **Plagiarism Detection**: Cross-submission similarity checking

### Developer Experience
- **Swagger/OpenAPI Documentation**: Interactive API documentation
- **Docker Production Setup**: Multi-stage builds, health checks
- **CI/CD Pipeline**: Automated testing and deployment
- **Monitoring**: Prometheus/Grafana integration
- **Logging**: Structured logging with ELK stack