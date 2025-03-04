# Creating Students Table
   CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL
	);

# Assigning Values into students Table
INSERT INTO Students VALUES (1, 'Virat', 'virat@gmail.com'); 
INSERT INTO Students VALUES (2, 'Anushka', 'anushka@gmail.com');
INSERT INTO Students VALUES (3, 'Arjun', 'arjun@gmail.com');
INSERT INTO Students VALUES (4, 'Sneha', 'sneha@gmail.com');
INSERT INTO Students VALUES (5, 'Siddharth', 'siddharth@gmail.com');
INSERT INTO Students VALUES (6, 'Kiara', 'kiara@gmail.com');
INSERT INTO Students VALUES (7, 'Tarak', 'tarak@gmail.com');
INSERT INTO Students VALUES (8, 'Pranitha', 'pranitha@gmail.com');
INSERT INTO Students VALUES (9, 'Ritesh', 'ritesh@gmail.com');
INSERT INTO Students VALUES (10, 'Genelia', 'genelia@gmail.com');

#Creating Courses Table
CREATE TABLE Courses (
   Course_id INT PRIMARY KEY,
   Course_name VARCHAr (50) NOT NULL,
   Course_description TEXT
   );

# Assigning values into courses table
INSERT INTO Courses VALUES (103, 'Data Science', 'NA');
INSERT INTO Courses VALUES (113, 'Machine Learning', 'NA');
INSERT INTO Courses VALUES (123, 'SQL', 'NA');
INSERT INTO Courses VALUES (133, 'Biology', 'NA');

#Creating Enrolments table
CREATE TABLE Enrolments (
   Enrolment_id INT PRIMARY KEY,
   Student_id INT,
   Course_id INT,
   Enrolment_date DATE,
   FOREIGN KEY (student_id) REFERENCES Students(student_id),
   FOREIGN KEY (course_id) REFERENCES Courses(course_id)
   );

#Assigning values into Enrolments Table
INSERT INTO Enrolments VALUES (11, 1, 103, '2024-05-17');
INSERT INTO Enrolments VALUES (21, 1, 123, '2024-05-17');
INSERT INTO Enrolments VALUES (12, 2, 103, '2024-05-18');
INSERT INTO Enrolments VALUES (13, 3, 113, '2024-06-11');
INSERT INTO Enrolments VALUES (14, 4, 113, '2024-06-16');
INSERT INTO Enrolments VALUES (15, 5, 123, '2024-06-27');
INSERT INTO Enrolments VALUES (16, 6, 123, '2024-05-27');
INSERT INTO Enrolments VALUES (22, 6, 103, '2024-05-27');
INSERT INTO Enrolments VALUES (17, 7, 113, '2024-04-29');
INSERT INTO Enrolments VALUES (18, 8, 103, '2024-04-29');
INSERT INTO Enrolments VALUES (19, 9, 123, '2024-05-13');
INSERT INTO Enrolments VALUES (20, 10, 113, '2024-06-07');
INSERT INTO Enrolments VALUES (23, 10, 123, '2024-06-07');

# 1) List all students and the courses they are enrolled in
SELECT 
    Students.name AS student_name, 
    Courses.course_name AS course_name
FROM Enrolments
INNER JOIN Students ON Enrolments.student_id = Students.student_id
INNER JOIN Courses ON Enrolments.course_id = Courses.course_id;

# 2) Find the number of students enrolled in each course
SELECT 
    Courses.course_id, 
    Courses.course_name, 
    COUNT(Enrolments.student_id) AS num_enrolled_students
FROM Courses
LEFT JOIN Enrolments ON Courses.course_id = Enrolments.course_id
GROUP BY Courses.course_id, Courses.course_name;

# 3)  List students who have enrolled in more than one course.
SELECT 
    student_id, 
    COUNT(course_id) AS num_courses_enrolled
FROM Enrolments
GROUP BY student_id
HAVING COUNT(course_id) > 1;

# 4) Find courses with no enrolled students
SELECT 
    Courses.course_id, 
    Courses.course_name
FROM Courses
LEFT JOIN Enrolments ON Courses.course_id = Enrolments.course_id
WHERE Enrolments.enrolment_id IS NULL;


