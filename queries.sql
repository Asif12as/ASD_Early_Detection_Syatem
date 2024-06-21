-- Query to find all employees who have been hired in the last year
SELECT employee_id, first_name, last_name, hire_date
FROM employees
WHERE hire_date >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR);

-- Query to calculate the total salary expenditure for each department
SELECT d.department_id, d.department_name, SUM(s.salary) AS total_salary_expenditure
FROM departments d
JOIN employees e ON d.department_id = e.department_id
JOIN salaries s ON e.employee_id = s.employee_id
GROUP BY d.department_id, d.department_name;

-- Query to find the top 5 highest-paid employees along with their department names
SELECT e.employee_id, e.first_name, e.last_name, d.department_name, MAX(s.salary) AS max_salary
FROM employees e
JOIN salaries s ON e.employee_id = s.employee_id
JOIN departments d ON e.department_id = d.department_id
GROUP BY e.employee_id, e.first_name, e.last_name, d.department_name
ORDER BY max_salary DESC
LIMIT 5;
