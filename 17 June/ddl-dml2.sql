DROP DATABASE IF EXISTS LearnSQL;
CREATE DATABASE LearnSQL;
USE LearnSQL;

CREATE TABLE Students (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    Gender ENUM('Male', 'Female'),
    EnrollmentDate DATE
);

CREATE TABLE Courses (
    CourseID INT AUTO_INCREMENT PRIMARY KEY,
    CourseName VARCHAR(100),
    Credits INT
);

CREATE TABLE Enrollments (
    EnrollmentID INT AUTO_INCREMENT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    Grade ENUM('A', 'B', 'C', 'D', 'F'),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO Students (FirstName, LastName, DateOfBirth, Gender, EnrollmentDate)
VALUES 
('John', 'Doe', '2000-01-01', 'Male', '2018-09-01'),
('Jane', 'Smith', '1999-05-15', 'Female', '2017-09-01'),
('Alice', 'Johnson', '2001-02-20', 'Female', '2019-09-01');

INSERT INTO Courses (CourseName, Credits)
VALUES 
('Database Systems', 3),
('Data Structures', 4),
('Operating Systems', 3);

INSERT INTO Enrollments (StudentID, CourseID, Grade)
VALUES 
(1, 1, 'A'),
(1, 2, 'B'),
(2, 1, 'A'),
(2, 3, 'C'),
(3, 2, 'B');

UPDATE Students
SET LastName = 'Doe-Smith'
WHERE StudentID = 1;

DELETE FROM Courses
WHERE CourseID = 3;

SELECT * FROM Students;

SELECT Students.FirstName, Students.LastName, Courses.CourseName, Enrollments.Grade
FROM Enrollments
JOIN Students ON Enrollments.StudentID = Students.StudentID
JOIN Courses ON Enrollments.CourseID = Courses.CourseID
WHERE Enrollments.Grade = 'A';

ALTER TABLE Students
ADD Email VARCHAR(100);

DROP TABLE Enrollments;

CREATE VIEW StudentCourses AS
SELECT Students.FirstName, Students.LastName, Courses.CourseName
FROM Students
JOIN Enrollments ON Students.StudentID = Enrollments.StudentID
JOIN Courses ON Enrollments.CourseID = Courses.CourseID;

SELECT * FROM StudentCourses;
