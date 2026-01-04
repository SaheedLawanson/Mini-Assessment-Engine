--
-- PostgreSQL database dump
--

\restrict Rfadi8hBwAwqZpMkId9qtc3DTcalrhRXg8DsH38MQv6OkLEiCvU841NKaPZnQ5P

-- Dumped from database version 16.10 (Debian 16.10-1.pgdg13+1)
-- Dumped by pg_dump version 16.10 (Debian 16.10-1.pgdg13+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (1, 'pbkdf2_sha256$1200000$kz2b4Od31mt3p0wTaL7QRE$PFvI3npF6m5OC5ZW/jYJFOc7KRgS4pwd/Cm+CVnCnX0=', NULL, false, '230501001', 'Adebayo', 'Adeyemi', '230501001@unilag.edu.ng', false, true, '2026-01-04 18:28:29.186548+00');
INSERT INTO public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (2, 'pbkdf2_sha256$1200000$giN2rPCFehgZgJbTtX2iDd$l8C5nQQyUjXN4WBNYvl7LFn03eJHEQda6eU5xDZM9js=', NULL, false, '230501002', 'Chioma', 'Okafor', '230501002@unilag.edu.ng', false, true, '2026-01-04 18:28:29.333551+00');
INSERT INTO public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (3, 'pbkdf2_sha256$1200000$8OMbMJfNvWlbX41BMXcNjI$ZbO4nSmW/dLoajEhx8gSEOxKR7Lbjv8ZNlehHhp7oRY=', NULL, false, '230501003', 'Oluwaseun', 'Bello', '230501003@unilag.edu.ng', false, true, '2026-01-04 18:28:29.469715+00');
INSERT INTO public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (4, 'pbkdf2_sha256$1200000$QzIoSEnJkcDO73pEdDqJ13$a1uN1im96VHK4qX80hybLO7Lli/h4GY15u9+LIGT1WM=', NULL, false, '230501004', 'Ngozi', 'Okonkwo', '230501004@unilag.edu.ng', false, true, '2026-01-04 18:28:29.604712+00');
INSERT INTO public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (5, 'pbkdf2_sha256$1200000$4ikPmDgge9x7iC1xUNg9t4$piqykwQZ1qcGvoyqIBWFFQSvCpDkHpQ3AALcbE2Fdvo=', NULL, false, '230501005', 'Tunde', 'Williams', '230501005@unilag.edu.ng', false, true, '2026-01-04 18:28:29.741185+00');
INSERT INTO public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (6, 'pbkdf2_sha256$1200000$Y3uKOLIbP9WLyjajUwRhV3$QS8CwcbBP35CyEf3rbVyaMHW7bbIMC93s38BamuRDUk=', NULL, false, '230501006', 'Amara', 'Nwosu', '230501006@unilag.edu.ng', false, true, '2026-01-04 18:28:29.87991+00');
INSERT INTO public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (7, 'pbkdf2_sha256$1200000$sreRHVe8VykkUGPSbKIkt2$ePveJsGA5ibLknPX5uzr3sOHUghfAhAkgTaqHfJnvrY=', NULL, false, '230501007', 'Emeka', 'Adeleke', '230501007@unilag.edu.ng', false, true, '2026-01-04 18:28:30.016927+00');
INSERT INTO public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (8, 'pbkdf2_sha256$1200000$sCSJXjBgayatA0OPbgPhp6$LKNjMQiEb2+NwOB5hZ0lApI9wcaCTf5MUxEic+yHo3M=', NULL, false, '230501008', 'Fatima', 'Mohammed', '230501008@unilag.edu.ng', false, true, '2026-01-04 18:28:30.154628+00');
INSERT INTO public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (9, 'pbkdf2_sha256$1200000$EuIdKIdo5bK7Eq92PvnnDa$4zvJL0mrfD20Zgj1N9yzPGKQW0LAYORtaQDpuetlPLU=', NULL, false, '230501009', 'Ibrahim', 'Okoro', '230501009@unilag.edu.ng', false, true, '2026-01-04 18:28:30.292034+00');
INSERT INTO public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (10, 'pbkdf2_sha256$1200000$p6JYvK76uQHWkXO8UBkHMR$U4AmMindlNX04jR3eGwwDxySRcyfmZ80W8kTnQuEJZA=', NULL, false, '230501010', 'Yetunde', 'Eze', '230501010@unilag.edu.ng', false, true, '2026-01-04 18:28:30.429035+00');
INSERT INTO public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (11, 'pbkdf2_sha256$1200000$ZxYYXpeePzjApajQ3rFEl7$7XHdAA4iQgyo/TJNynnv4ARWFLgJfYCKTXG73hTLmM0=', NULL, true, 'admin', '', '', 'admin@acadai.ai', true, true, '2026-01-04 22:27:25.496857+00');


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.authtoken_token (key, created, user_id) VALUES ('40539c766a2fb9a2e58d4a0c14e31433f7e141ef', '2026-01-04 22:19:26.342136+00', 7);


--
-- Data for Name: courses_course; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.courses_course (id, created_at, updated_at, title, code) VALUES (1, '2026-01-04 18:28:30.566633+00', '2026-01-04 18:28:30.566638+00', 'Advanced Meme Theory and Internet Culture', 'FUN 420');


--
-- Data for Name: exams_exam; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.exams_exam (id, created_at, updated_at, title, metadata, duration_minutes, is_published, year, course_id) VALUES (1, '2026-01-04 18:28:30.568742+00', '2026-01-04 18:28:30.568748+00', 'Final Boss Battle: The Ultimate Meme Quiz', '{"session": "2024/2025", "semester": "First", "instructions": "Answer all questions. No cheating by Googling. We trust you (but not really)."}', 69, true, 2024, 1);


--
-- Data for Name: questions_question; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.questions_question (id, question_type, text, expected_answer, marks, "position", exam_id) VALUES (1, 'MCQ', 'What is the correct way to respond when someone says "We have food at home"?', 'B', 2.00, 1, 1);
INSERT INTO public.questions_question (id, question_type, text, expected_answer, marks, "position", exam_id) VALUES (2, 'MCQ', 'When your code works but you don''t know why, what is the appropriate action?', 'C', 2.00, 2, 1);
INSERT INTO public.questions_question (id, question_type, text, expected_answer, marks, "position", exam_id) VALUES (3, 'MCQ', 'What is the scientific name for the 3 AM realization that you forgot something important?', 'B', 2.00, 3, 1);
INSERT INTO public.questions_question (id, question_type, text, expected_answer, marks, "position", exam_id) VALUES (4, 'MCQ', 'According to internet law, how long can milk sit outside the fridge in a university hostel?', 'C', 2.00, 4, 1);
INSERT INTO public.questions_question (id, question_type, text, expected_answer, marks, "position", exam_id) VALUES (5, 'MCQ', 'What happens when you tell yourself "just one more episode" at 2 AM?', 'B', 2.00, 5, 1);
INSERT INTO public.questions_question (id, question_type, text, expected_answer, marks, "position", exam_id) VALUES (6, 'MCQ', 'In Nigerian universities, what is the lecturer''s favorite phrase?', 'D', 2.00, 6, 1);
INSERT INTO public.questions_question (id, question_type, text, expected_answer, marks, "position", exam_id) VALUES (7, 'MCQ', 'What is the proper response when your roommate eats your food?', 'B', 2.00, 7, 1);
INSERT INTO public.questions_question (id, question_type, text, expected_answer, marks, "position", exam_id) VALUES (8, 'MCQ', 'What does "I''m 5 minutes away" actually mean in Lagos/UNILAG?', 'B', 2.00, 8, 1);
INSERT INTO public.questions_question (id, question_type, text, expected_answer, marks, "position", exam_id) VALUES (9, 'MCQ', 'According to meme physics, what force makes you check your phone 5 seconds after checking it?', 'B', 2.00, 9, 1);
INSERT INTO public.questions_question (id, question_type, text, expected_answer, marks, "position", exam_id) VALUES (10, 'MCQ', 'What is the most powerful sentence in the Nigerian student vocabulary?', 'B', 2.00, 10, 1);
INSERT INTO public.questions_question (id, question_type, text, expected_answer, marks, "position", exam_id) VALUES (11, 'THEORY', 'What is photosynthesis?', 'Photosynthesis is the process by which plants convert light energy into chemical energy. Plants use sunlight, water, and carbon dioxide to produce glucose and oxygen.', 10.00, 11, 1);
INSERT INTO public.questions_question (id, question_type, text, expected_answer, marks, "position", exam_id) VALUES (12, 'THEORY', 'Explain the water cycle.', 'The water cycle is the continuous movement of water on, above, and below the Earth''s surface. It involves evaporation, condensation, precipitation, and collection.', 10.00, 12, 1);
INSERT INTO public.questions_question (id, question_type, text, expected_answer, marks, "position", exam_id) VALUES (13, 'THEORY', 'What is the law of gravity?', 'The law of gravity states that every object in the universe attracts every other object. The force of attraction depends on the mass of the objects and the distance between them.', 10.00, 13, 1);
INSERT INTO public.questions_question (id, question_type, text, expected_answer, marks, "position", exam_id) VALUES (14, 'THEORY', 'Define democracy and explain its key features.', 'Democracy is a system of government where power is vested in the people. Key features include free and fair elections, rule of law, and protection of human rights.', 10.00, 14, 1);
INSERT INTO public.questions_question (id, question_type, text, expected_answer, marks, "position", exam_id) VALUES (15, 'THEORY', 'What is the Pythagorean theorem?', 'The Pythagorean theorem states that in a right-angled triangle, the square of the hypotenuse equals the sum of squares of the other two sides. The formula is a² + b² = c².', 10.00, 15, 1);


--
-- Data for Name: choice_choice; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.choice_choice (id, created_at, updated_at, option, text, is_correct, question_id) VALUES (1, '2026-01-04 18:28:30.576909+00', '2026-01-04 18:28:30.576913+00', 'A', 'Accept it gracefully', false, 1);
INSERT INTO public.choice_choice (id, created_at, updated_at, option, text, is_correct, question_id) VALUES (2, '2026-01-04 18:28:30.579926+00', '2026-01-04 18:28:30.57993+00', 'B', 'Cry internally but accept your fate', true, 1);
INSERT INTO public.choice_choice (id, created_at, updated_at, option, text, is_correct, question_id) VALUES (3, '2026-01-04 18:28:30.581119+00', '2026-01-04 18:28:30.581122+00', 'C', 'Order food anyway when they''re not looking', false, 1);
INSERT INTO public.choice_choice (id, created_at, updated_at, option, text, is_correct, question_id) VALUES (4, '2026-01-04 18:28:30.58236+00', '2026-01-04 18:28:30.582363+00', 'D', 'Start a protest movement', false, 1);
INSERT INTO public.choice_choice (id, created_at, updated_at, option, text, is_correct, question_id) VALUES (5, '2026-01-04 18:28:30.584245+00', '2026-01-04 18:28:30.584248+00', 'A', 'Investigate thoroughly to understand', false, 2);
INSERT INTO public.choice_choice (id, created_at, updated_at, option, text, is_correct, question_id) VALUES (6, '2026-01-04 18:28:30.585268+00', '2026-01-04 18:28:30.585271+00', 'B', 'Show it to everyone immediately', false, 2);
INSERT INTO public.choice_choice (id, created_at, updated_at, option, text, is_correct, question_id) VALUES (7, '2026-01-04 18:28:30.586124+00', '2026-01-04 18:28:30.586128+00', 'C', 'Don''t touch it, don''t look at it, pretend it doesn''t exist', true, 2);
INSERT INTO public.choice_choice (id, created_at, updated_at, option, text, is_correct, question_id) VALUES (8, '2026-01-04 18:28:30.586988+00', '2026-01-04 18:28:30.586991+00', 'D', 'Delete it and rewrite from scratch', false, 2);
INSERT INTO public.choice_choice (id, created_at, updated_at, option, text, is_correct, question_id) VALUES (9, '2026-01-04 18:28:30.589335+00', '2026-01-04 18:28:30.58934+00', 'A', 'Insomnia Regularis', false, 3);
INSERT INTO public.choice_choice (id, created_at, updated_at, option, text, is_correct, question_id) VALUES (10, '2026-01-04 18:28:30.590588+00', '2026-01-04 18:28:30.590593+00', 'B', 'Panicattackus Nocturnus', true, 3);
INSERT INTO public.choice_choice (id, created_at, updated_at, option, text, is_correct, question_id) VALUES (11, '2026-01-04 18:28:30.59125+00', '2026-01-04 18:28:30.591255+00', 'C', 'Forgetfulness Syndrome', false, 3);
INSERT INTO public.choice_choice (id, created_at, updated_at, option, text, is_correct, question_id) VALUES (12, '2026-01-04 18:28:30.591859+00', '2026-01-04 18:28:30.591863+00', 'D', 'Midnight Anxiety Disorder', false, 3);
INSERT INTO public.choice_choice (id, created_at, updated_at, option, text, is_correct, question_id) VALUES (13, '2026-01-04 18:28:30.593149+00', '2026-01-04 18:28:30.593153+00', 'A', '2 hours maximum', false, 4);
INSERT INTO public.choice_choice (id, created_at, updated_at, option, text, is_correct, question_id) VALUES (14, '2026-01-04 18:28:30.593709+00', '2026-01-04 18:28:30.593713+00', 'B', 'Until someone sniffs it', false, 4);
INSERT INTO public.choice_choice (id, created_at, updated_at, option, text, is_correct, question_id) VALUES (15, '2026-01-04 18:28:30.594254+00', '2026-01-04 18:28:30.594257+00', 'C', 'Bold of you to assume we have milk', true, 4);
INSERT INTO public.choice_choice (id, created_at, updated_at, option, text, is_correct, question_id) VALUES (16, '2026-01-04 18:28:30.594771+00', '2026-01-04 18:28:30.594774+00', 'D', 'Milk is eternal in hostel', false, 4);
INSERT INTO public.choice_choice (id, created_at, updated_at, option, text, is_correct, question_id) VALUES (17, '2026-01-04 18:28:30.595911+00', '2026-01-04 18:28:30.595914+00', 'A', 'You watch one episode and sleep', false, 5);
INSERT INTO public.choice_choice (id, created_at, updated_at, option, text, is_correct, question_id) VALUES (18, '2026-01-04 18:28:30.596421+00', '2026-01-04 18:28:30.596425+00', 'B', 'You finish the entire season and question your life choices', true, 5);
INSERT INTO public.choice_choice (id, created_at, updated_at, option, text, is_correct, question_id) VALUES (19, '2026-01-04 18:28:30.596948+00', '2026-01-04 18:28:30.596951+00', 'C', 'Your phone dies and saves you', false, 5);
INSERT INTO public.choice_choice (id, created_at, updated_at, option, text, is_correct, question_id) VALUES (20, '2026-01-04 18:28:30.597525+00', '2026-01-04 18:28:30.597528+00', 'D', 'You fall asleep after 5 minutes', false, 5);
INSERT INTO public.choice_choice (id, created_at, updated_at, option, text, is_correct, question_id) VALUES (21, '2026-01-04 18:28:30.598721+00', '2026-01-04 18:28:30.598726+00', 'A', 'This question is simple. Just apply what I taught you.', false, 6);
INSERT INTO public.choice_choice (id, created_at, updated_at, option, text, is_correct, question_id) VALUES (22, '2026-01-04 18:28:30.599236+00', '2026-01-04 18:28:30.59924+00', 'B', 'Let me explain this again', false, 6);
INSERT INTO public.choice_choice (id, created_at, updated_at, option, text, is_correct, question_id) VALUES (23, '2026-01-04 18:28:30.599778+00', '2026-01-04 18:28:30.599781+00', 'C', 'Everyone will pass this course', false, 6);
INSERT INTO public.choice_choice (id, created_at, updated_at, option, text, is_correct, question_id) VALUES (24, '2026-01-04 18:28:30.600291+00', '2026-01-04 18:28:30.600295+00', 'D', 'A is for God, B is for me', true, 6);
INSERT INTO public.choice_choice (id, created_at, updated_at, option, text, is_correct, question_id) VALUES (25, '2026-01-04 18:28:30.601461+00', '2026-01-04 18:28:30.601465+00', 'A', 'Forgive and forget immediately', false, 7);
INSERT INTO public.choice_choice (id, created_at, updated_at, option, text, is_correct, question_id) VALUES (26, '2026-01-04 18:28:30.602006+00', '2026-01-04 18:28:30.60201+00', 'B', 'Plan elaborate revenge while saying "no problem"', true, 7);
INSERT INTO public.choice_choice (id, created_at, updated_at, option, text, is_correct, question_id) VALUES (27, '2026-01-04 18:28:30.602484+00', '2026-01-04 18:28:30.602488+00', 'C', 'Buy more food to share', false, 7);
INSERT INTO public.choice_choice (id, created_at, updated_at, option, text, is_correct, question_id) VALUES (28, '2026-01-04 18:28:30.602998+00', '2026-01-04 18:28:30.603001+00', 'D', 'Move out immediately', false, 7);
INSERT INTO public.choice_choice (id, created_at, updated_at, option, text, is_correct, question_id) VALUES (29, '2026-01-04 18:28:30.604787+00', '2026-01-04 18:28:30.604791+00', 'A', 'I will arrive in exactly 5 minutes', false, 8);
INSERT INTO public.choice_choice (id, created_at, updated_at, option, text, is_correct, question_id) VALUES (30, '2026-01-04 18:28:30.605352+00', '2026-01-04 18:28:30.605356+00', 'B', 'I just woke up', true, 8);
INSERT INTO public.choice_choice (id, created_at, updated_at, option, text, is_correct, question_id) VALUES (31, '2026-01-04 18:28:30.606433+00', '2026-01-04 18:28:30.606437+00', 'C', 'I''m stuck in traffic but close', false, 8);
INSERT INTO public.choice_choice (id, created_at, updated_at, option, text, is_correct, question_id) VALUES (32, '2026-01-04 18:28:30.607142+00', '2026-01-04 18:28:30.607145+00', 'D', 'I''m actually 10 minutes away', false, 8);
INSERT INTO public.choice_choice (id, created_at, updated_at, option, text, is_correct, question_id) VALUES (33, '2026-01-04 18:28:30.608338+00', '2026-01-04 18:28:30.608341+00', 'A', 'Electromagnetic attraction', false, 9);
INSERT INTO public.choice_choice (id, created_at, updated_at, option, text, is_correct, question_id) VALUES (34, '2026-01-04 18:28:30.608891+00', '2026-01-04 18:28:30.608894+00', 'B', 'FOMOgravity', true, 9);
INSERT INTO public.choice_choice (id, created_at, updated_at, option, text, is_correct, question_id) VALUES (35, '2026-01-04 18:28:30.609402+00', '2026-01-04 18:28:30.609406+00', 'C', 'Social media magnetism', false, 9);
INSERT INTO public.choice_choice (id, created_at, updated_at, option, text, is_correct, question_id) VALUES (36, '2026-01-04 18:28:30.609986+00', '2026-01-04 18:28:30.609991+00', 'D', 'Digital addiction force', false, 9);
INSERT INTO public.choice_choice (id, created_at, updated_at, option, text, is_correct, question_id) VALUES (37, '2026-01-04 18:28:30.611071+00', '2026-01-04 18:28:30.611075+00', 'A', 'I studied very hard for this exam', false, 10);
INSERT INTO public.choice_choice (id, created_at, updated_at, option, text, is_correct, question_id) VALUES (38, '2026-01-04 18:28:30.611595+00', '2026-01-04 18:28:30.611599+00', 'B', 'Abeg, I no do assignment', true, 10);
INSERT INTO public.choice_choice (id, created_at, updated_at, option, text, is_correct, question_id) VALUES (39, '2026-01-04 18:28:30.6121+00', '2026-01-04 18:28:30.612103+00', 'C', 'I will definitely attend all lectures', false, 10);
INSERT INTO public.choice_choice (id, created_at, updated_at, option, text, is_correct, question_id) VALUES (40, '2026-01-04 18:28:30.612765+00', '2026-01-04 18:28:30.612768+00', 'D', 'I have completed all my projects', false, 10);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 11, true);


--
-- Name: choice_choice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.choice_choice_id_seq', 40, true);


--
-- Name: courses_course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.courses_course_id_seq', 1, true);


--
-- Name: exams_exam_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.exams_exam_id_seq', 1, true);


--
-- Name: questions_question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.questions_question_id_seq', 15, true);


--
-- PostgreSQL database dump complete
--

\unrestrict Rfadi8hBwAwqZpMkId9qtc3DTcalrhRXg8DsH38MQv6OkLEiCvU841NKaPZnQ5P

