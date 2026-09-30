USE student_management;
SELECT * FROM students;
-- TASK 2: SQL QUERY PRACTICE
USE student_management;

-- 1. SELECT all students
SELECT * FROM students;

-- 2. WHERE
SELECT * FROM students
WHERE course = 'BCA';

-- 3. ORDER BY
SELECT * FROM students
ORDER BY age ASC;

-- 4. DISTINCT
SELECT DISTINCT course
FROM students;

-- 5. LIMIT
SELECT * FROM students
LIMIT 2;

-- 6. LIKE
SELECT * FROM students
WHERE name LIKE 'A%';

-- 7. BETWEEN
SELECT * FROM students
WHERE age BETWEEN 18 AND 25;

-- 8. IN
SELECT * FROM students
WHERE course IN ('BCA', 'BBA');

-- 9. COUNT
SELECT COUNT(*) AS total_students
FROM students;

-- 10. GROUP BY
SELECT course, COUNT(*) AS total_students
FROM students
GROUP BY course;

-- 11. HAVING
SELECT course, COUNT(*) AS total_students
FROM students
GROUP BY course
HAVING COUNT(*) >= 1;