Create Database Accenture
USE Accenture

-- Accenture SQL Interview Questions With Examples
-- Description, This project is designed to prepare candidates for SQL interviews at Accenture, focusing on practical SQL,
-- skills relevant to data analysis. The project encompasses the creation of two relational tables, employees and projects,
-- to demonstrate various SQL concepts through practical examples. Key highlights include:


-- Employees Table

CREATE TABLE employees
(
e_id INT PRIMARY KEY,
e_name VARCHAR(50),
department VARCHAR(50)
)
INSERT INTO employees values(1,'John Doe','Finance'),
(2,'Jane Smith','IT'),
(3,'Mike Brown','Finance'),
(4,'Emma Wilson','IT'),
(5,'Sarah Davis','Finance')

Select * From employees

-- Project Table

CREATE TABLE projects
(
p_id INT PRIMARY KEY,
e_id INT,
p_name VARCHAR(50),
p_hours INT,
FOREIGN KEY (e_id) REFERENCES employees(e_id)
)
INSERT INTO projects Values(101,1,'Project A',100),
(102,2,'Project B',150),
(103,3,'Project A',120),
(104,4,'Project C',130),
(105,5,'Project B',140)

Select * From projects

-- Q1- Write an SQL query to find the top 2 employees from the Finance department who have worked the most hours across,
-- all projects.

Select e.e_name,
        SUM(p.p_hours) AS total_hours
from employees e
JOIN projects p
ON e.e_id = p.e_id
WHERE e.department = 'Finance'
Group by e.e_name
ORDER BY total_hours DESC

Select e.e_name,
        SUM(p.p_hours) AS total_hours
from employees e
JOIN projects p
ON e.e_id = p.e_id
WHERE e.department = 'Finance'
Group by e.e_name
ORDER BY total_hours DESC
OFFSET 0 ROWS FETCH NEXT 2 ROWS ONLY

--Q2- We are using an inner join between the employees and projects tables based on the employee_id.

SELECT e.e_name, p.p_name, p.p_hours
FROM employees e
JOIN projects p ON e.e_id = p.e_id

--Q3- The WHERE clause filters employees from the Finance department.

SELECT e.e_name, p.p_name, p.p_hours
FROM employees e
JOIN projects p ON e.e_id = p.e_id
WHERE e.department = 'Finance'

--Q4- SUM(p.project_hours) calculates the total hours worked by each employee on all projects

Select e.e_name,
        SUM(p.p_hours) AS total_hours
from employees e
JOIN projects p
ON e.e_id = p.e_id
WHERE e.department = 'Finance'
Group by e.e_name

--Q5- The GROUP BY clause groups the result by employee_name.

SELECT e.e_name,
       SUM(p.p_hours) AS total_hours
FROM employees e
JOIN projects p ON e.e_id = p.e_id
WHERE e.department = 'Finance'
GROUP BY e.e_name
ORDER BY total_hours DESC
OFFSET 0 ROWS FETCH NEXT 2 ROWS ONLY

-- The Role of the GROUP BY Clause
-- Statement: The GROUP BY clause groups the result by employee name.

SELECT e.e_name, SUM(p.p_hours) AS total_hours
FROM employees e
JOIN projects p ON e.e_id = p.e_id
WHERE e.department = 'Finance'
GROUP BY e.e_name

