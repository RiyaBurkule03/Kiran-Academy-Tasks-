CREATE DATABASE IF NOT EXISTS company_db;
USE company_db;

DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    department VARCHAR(50),
    salary DECIMAL(10,2),
    city VARCHAR(50),
    joining_date DATE,
    email VARCHAR(100) NULL,
    status VARCHAR(20)
);

-- Tasks 1–12: Basic equality and comparison
-- 1. Employees from Pune
SELECT * FROM employees WHERE city = 'Pune';

-- 2. Employees from Mumbai
SELECT * FROM employees WHERE city = 'Mumbai';

-- 3. Employees in IT
SELECT * FROM employees WHERE department = 'IT';

-- 4. Employees in HR
SELECT * FROM employees WHERE department = 'HR';

-- 5. Employees in Sales
SELECT * FROM employees WHERE department = 'Sales';

-- 6. Active employees
SELECT * FROM employees WHERE status = 'Active';

-- 7. Inactive employees
SELECT * FROM employees WHERE status = 'Inactive';

-- 8. Employee with ID 103
SELECT * FROM employees WHERE employee_id = 103;

-- 9. Employee named Priya Sharma
SELECT * FROM employees WHERE employee_name = 'Priya Sharma';

-- 10. Employees earning 35000
SELECT * FROM employees WHERE salary = 35000;

-- 11. Employees not from Pune
SELECT * FROM employees WHERE city != 'Pune';

-- 12. Employees not in Testing
SELECT * FROM employees WHERE department <> 'Testing';


-- Tasks 13–20: Relational comparisons
-- 13. Salary greater than 40000
SELECT * FROM employees WHERE salary > 40000;

-- 14. Salary less than 35000
SELECT * FROM employees WHERE salary < 35000;

-- 15. Salary at least 50000
SELECT * FROM employees WHERE salary >= 50000;

-- 16. Salary no more than 30000
SELECT * FROM employees WHERE salary <= 30000;

-- 17. Joined after January 1, 2025
SELECT * FROM employees WHERE joining_date > '2025-01-01';

-- 18. Joined on or before December 31, 2024
SELECT * FROM employees WHERE joining_date <= '2024-12-31';

-- 19. Employee ID greater than 110
SELECT * FROM employees WHERE employee_id > 110;

-- 20. Names and joining dates for employees who joined from January 1, 2026
SELECT employee_name, joining_date
FROM employees
WHERE joining_date >= '2026-01-01';


-- Tasks 21–28: AND conditions
-- 21. Active employees from Pune
SELECT * FROM employees
WHERE city = 'Pune' AND status = 'Active';

-- 22. IT employees earning more than 50000
SELECT * FROM employees
WHERE department = 'IT' AND salary > 50000;

-- 23. Inactive employees from Mumbai
SELECT * FROM employees
WHERE city = 'Mumbai' AND status = 'Inactive';

-- 24. Sales employees from Pune earning at least 42000
SELECT * FROM employees
WHERE department = 'Sales' AND city = 'Pune' AND salary >= 42000;

-- 25. HR employees who joined after June 1, 2025
SELECT * FROM employees
WHERE department = 'HR' AND joining_date > '2025-06-01';

-- 26. Active employees earning from 40000 through 70000
SELECT * FROM employees
WHERE status = 'Active' AND salary >= 40000 AND salary <= 70000;

-- 27. Testing employees from Mumbai earning over 38000
SELECT * FROM employees
WHERE city = 'Mumbai' AND department = 'Testing' AND salary > 38000;

-- 28. Active employees who joined from January 1, 2026 and earn over 45000
SELECT * FROM employees
WHERE status = 'Active'
  AND joining_date >= '2026-01-01'
  AND salary > 45000;


-- Tasks 29–36: OR and NOT conditions
-- 29. Employees from Pune or Mumbai
SELECT * FROM employees
WHERE city = 'Pune' OR city = 'Mumbai';

-- 30. Employees in IT or HR
SELECT * FROM employees
WHERE department = 'IT' OR department = 'HR';

-- 31. Salary below 32000 or above 60000
SELECT * FROM employees
WHERE salary < 32000 OR salary > 60000;

-- 32. Employees from Nashik or earning over 55000
SELECT * FROM employees
WHERE city = 'Nashik' OR salary > 55000;

-- 33. Employees not in HR
SELECT * FROM employees
WHERE NOT department = 'HR';

-- 34. Employees whose status is not Inactive
SELECT * FROM employees
WHERE status <> 'Inactive';

-- 35. Active employees from Pune or Mumbai
SELECT * FROM employees
WHERE (city = 'Pune' OR city = 'Mumbai')
  AND status = 'Active';

-- 36. Employees outside Pune earning over 40000
SELECT * FROM employees
WHERE city <> 'Pune' AND salary > 40000;