CREATE TABLE student (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    course_id INT
);

INSERT INTO student VALUES
(1, 'Rahul', 101),
(2, 'Neha', 102),
(3, 'Aman', 103),
(4, 'Priya', 101),
(5, 'Riya', 104);

CREATE TABLE course (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50)
);

INSERT INTO course VALUES
(101, 'MCA'),
(102, 'BCA'),
(103, 'MBA'),
(104, 'B.Tech');

SELECT student.student_name, course.course_name
FROM student
INNER JOIN course
ON student.course_id = course.course_id;