CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    course VARCHAR(100),
    age INT
);
INSERT INTO students (student_id, name, email, course, age)
VALUES
(1, 'Anupama', 'anupama@gmail.com', 'BCA', 20),
(2, 'Sasmita', 'sasmita@gmail.com', 'BCA', 19),
(3, 'Sudiksha', 'sudiksha@gmail.com', 'BCA', 19);
SELECT * FROM students;
UPDATE students
SET age = 21
WHERE student_id = 1;
SELECT * FROM students;
DELETE FROM students
WHERE student_id = 3;
SELECT * FROM students;
SELECT * FROM students
WHERE age > 20;
SELECT * FROM students
ORDER BY age ASC;
SELECT DISTINCT course
FROM students;
SELECT * FROM students
LIMIT 1;
SELECT * FROM students
WHERE name LIKE 'A%';
SELECT * FROM students
WHERE age BETWEEN 18 AND 20;
SELECT * FROM students
WHERE age IN (19, 21);
SELECT COUNT(*) AS total_students
FROM students;
SELECT AVG(age) AS average_age
FROM students;
SELECT MAX(age) AS highest_age
FROM students;
SELECT MIN(age) AS lowest_age
FROM students;
SELECT SUM(age) AS total_age
FROM students;
SELECT course, COUNT(*) AS total_students
FROM students
GROUP BY course;
SELECT course, COUNT(*) AS total_students
FROM students
GROUP BY course
HAVING COUNT(*) >= 2;
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);
INSERT INTO departments (department_id, department_name)
VALUES
(1, 'Computer Science'),
(2, 'Information Technology');
ALTER TABLE students
ADD department_id INT;
UPDATE students
SET department_id = 1
WHERE student_id = 1;
UPDATE students
SET department_id = 2
WHERE student_id = 2;
SELECT students.name, departments.department_name
FROM students
INNER JOIN departments
ON students.department_id = departments.department_id;
SELECT students.name, departments.department_name
FROM students
LEFT JOIN departments
ON students.department_id = departments.department_id;
SELECT students.name, departments.department_name
FROM students
RIGHT JOIN departments
ON students.department_id = departments.department_id;

