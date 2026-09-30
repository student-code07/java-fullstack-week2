-- TASK 5: EMPLOYEE MANAGEMENT SYSTEMS
USE student_management;

-- EMPLOYEE TABLE
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    department VARCHAR(50),
    salary DECIMAL(10,2)
);
-- INSERT EMPLOYEE DATA
INSERT INTO employees (employee_id, employee_name, email, department, salary)
VALUES
(1, 'Anupama', 'anupama.emp@gmail.com', 'IT', 35000),
(2, 'Sasmita', 'sasmita.emp@gmail.com', 'HR', 32000),
(3, 'Sudiksha', 'sudiksha.emp@gmail.com', 'Finance', 40000),
(4, 'Riya', 'riya.emp@gmail.com', 'IT', 38000),
(5, 'Priya', 'priya.emp@gmail.com', 'HR', 30000);
-- VIEW ALL EMPLOYEES
SELECT * FROM employees;

-- SEARCH EMPLOYEE BY DEPARTMENT
SELECT * FROM employees
WHERE department = 'IT';

-- UPDATE EMPLOYEE SALARY
UPDATE employees
SET salary = 42000
WHERE employee_id = 3;

-- DELETE EMPLOYEE
DELETE FROM employees
WHERE employee_id = 5;

-- HIGHEST SALARY
SELECT * FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees);

-- AVERAGE SALARY BY DEPARTMENT
SELECT department, AVG(salary) AS average_salary
FROM employees
GROUP BY department;

-- EMPLOYEE COUNT BY DEPARTMENT
SELECT department, COUNT(*) AS total_employees
FROM employees
GROUP BY department;