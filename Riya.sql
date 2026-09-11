-- SQL DDL/DML Practice: Tasks 1-60
-- MySQL Workbench: run this file from top to bottom.

CREATE DATABASE IF NOT EXISTS company_db;
USE company_db;

-- Task 3
DROP TABLE IF EXISTS employees;
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    city VARCHAR(50),
    joining_date DATE,
    status VARCHAR(20)
);

-- Tasks 4-5
DESC employees;
SHOW TABLES;

-- Tasks 6-11
INSERT INTO employees VALUES
(101, 'Rahul Patil', 'Development', 45000, 'Pune', '2026-01-10', 'Active'),
(102, 'Priya Sharma', 'Testing', 38000, 'Mumbai', '2026-02-15', 'Active'),
(103, 'Amit Joshi', 'Development', 52000, 'Pune', '2025-12-05', 'Active'),
(104, 'Sneha Kulkarni', 'HR', 35000, 'Nashik', '2026-03-20', 'Active'),
(105, 'Rohan Deshmukh', 'Support', 30000, 'Mumbai', '2026-04-01', 'Inactive'),
(106, 'Anjali More', 'Testing', 42000, 'Pune', '2026-05-12', 'Active');

-- Tasks 12-30
SELECT * FROM employees;
SELECT employee_name FROM employees;
SELECT employee_name, salary FROM employees;
SELECT employee_name, department, city FROM employees;
SELECT * FROM employees WHERE city = 'Pune';
SELECT * FROM employees WHERE city = 'Mumbai';
SELECT * FROM employees WHERE department = 'Development';
SELECT * FROM employees WHERE department = 'Testing';
SELECT * FROM employees WHERE status = 'Active';
SELECT * FROM employees WHERE status = 'Inactive';
SELECT * FROM employees WHERE employee_id = 103;
SELECT * FROM employees WHERE employee_name = 'Priya Sharma';
SELECT * FROM employees WHERE salary > 40000;
SELECT * FROM employees WHERE salary < 40000;
SELECT * FROM employees WHERE salary = 35000;
SELECT * FROM employees WHERE salary >= 42000;
SELECT * FROM employees WHERE city = 'Pune' AND status = 'Active';
SELECT * FROM employees WHERE department = 'Development' AND salary > 45000;
SELECT * FROM employees WHERE city = 'Pune' OR city = 'Mumbai';

-- Tasks 31-38
-- Each statement includes employee_id so it works with Safe Update Mode.
UPDATE employees SET salary = 48000 WHERE employee_id = 101;
UPDATE employees SET status = 'Active' WHERE employee_id = 105;
UPDATE employees SET city = 'Pune' WHERE employee_id = 104;
UPDATE employees SET department = 'Development' WHERE employee_id = 102;
UPDATE employees SET salary = 45000 WHERE employee_id = 106;
UPDATE employees SET salary = salary + 3000 WHERE employee_id = 103;
UPDATE employees SET salary = salary + 2000 WHERE employee_id = 106;
UPDATE employees SET city = 'Mumbai Branch' WHERE employee_id IN (102, 105);

-- Tasks 39-43
DELETE FROM employees WHERE employee_id = 105;
DELETE FROM employees WHERE employee_id = 105 AND employee_name = 'Rohan Deshmukh';
DELETE FROM employees WHERE employee_id = 105 AND status = 'Inactive';
DELETE FROM employees WHERE employee_id IN (101, 102, 103, 104, 105, 106) AND salary < 30000;
DELETE FROM employees WHERE employee_id = 104;

-- Tasks 44-50
ALTER TABLE employees ADD email VARCHAR(100);
ALTER TABLE employees ADD mobile VARCHAR(15);
ALTER TABLE employees MODIFY city VARCHAR(100);
ALTER TABLE employees RENAME COLUMN employee_name TO name;
ALTER TABLE employees DROP COLUMN mobile;
ALTER TABLE employees ADD experience INT;
UPDATE employees SET experience = 3 WHERE employee_id = 101;

-- Tasks 51-60
DROP TABLE IF EXISTS company_departments;
DROP TABLE IF EXISTS departments;

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100),
    location VARCHAR(100)
);

INSERT INTO departments VALUES
(1, 'Development', 'Pune'),
(2, 'Testing', 'Mumbai'),
(3, 'HR', 'Nashik');

SELECT * FROM departments;

UPDATE departments
SET location = 'Bangalore'
WHERE department_id = 1;

DELETE FROM departments
WHERE department_id = 3;

RENAME TABLE departments TO company_departments;

DESC company_departments;

TRUNCATE TABLE company_departments;

DROP TABLE company_departments;

select * from employees;
SHOW TABLES
-- E-commerce SQL DDL/DML Practice: Tasks 1-60
-- Run this file from top to bottom in MySQL Workbench.

-- Task 1-2
CREATE DATABASE IF NOT EXISTS ecommerce_db;
USE ecommerce_db;

-- Removes the old practice table so this script can be run again without errors.
DROP TABLE IF EXISTS products;

-- Task 3
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    brand VARCHAR(50),
    price DECIMAL(10,2),
    quantity INT,
    city VARCHAR(50),
    status VARCHAR(20)
);

-- Task 4-5
DESC products;
SHOW TABLES;

-- Task 6-15
INSERT INTO products VALUES
(201, 'Galaxy M55', 'Mobile', 'Samsung', 32000, 15, 'Pune', 'Available'),
(202, 'iPhone 15', 'Mobile', 'Apple', 65000, 8, 'Mumbai', 'Available'),
(203, 'Moto Edge 50', 'Mobile', 'Motorola', 28000, 20, 'Pune', 'Available'),
(204, 'Inspiron 15', 'Laptop', 'Dell', 58000, 6, 'Nashik', 'Available'),
(205, 'IdeaPad Slim 3', 'Laptop', 'Lenovo', 45000, 12, 'Mumbai', 'Available'),
(206, 'Galaxy Watch 6', 'Watch', 'Samsung', 22000, 4, 'Pune', 'Out of Stock'),
(207, 'Apple Watch SE', 'Watch', 'Apple', 30000, 10, 'Mumbai', 'Available'),
(208, 'Redmi Pad', 'Tablet', 'Xiaomi', 24000, 18, 'Pune', 'Available'),
(209, 'OnePlus Pad', 'Tablet', 'OnePlus', 35000, 5, 'Nashik', 'Available'),
(210, 'Bluetooth Speaker', 'Accessories', 'JBL', 7000, 25, 'Mumbai', 'Available');

-- Task 16-19
SELECT * FROM products;
SELECT product_name FROM products;
SELECT product_name, price FROM products;
SELECT product_name, category, brand, price FROM products;

-- Task 20-30
SELECT * FROM products WHERE city = 'Pune';
SELECT * FROM products WHERE city = 'Mumbai';
SELECT * FROM products WHERE category = 'Mobile';
SELECT * FROM products WHERE category = 'Laptop';
SELECT * FROM products WHERE price > 30000;
SELECT * FROM products WHERE price < 30000;
SELECT * FROM products WHERE price = 35000;
SELECT * FROM products WHERE price >= 45000;
SELECT * FROM products WHERE price <= 30000;
SELECT * FROM products WHERE quantity > 10;
SELECT * FROM products WHERE quantity < 10;

-- Task 31-40: Logical Operators
SELECT * FROM products WHERE city = 'Pune' AND category = 'Mobile';
SELECT * FROM products WHERE city = 'Mumbai' AND status = 'Available';
SELECT * FROM products WHERE price > 30000 AND quantity > 5;
SELECT * FROM products WHERE price >= 30000 AND price <= 60000;
SELECT * FROM products WHERE city = 'Pune' OR city = 'Mumbai';
SELECT * FROM products WHERE category = 'Mobile' OR category = 'Laptop';
SELECT * FROM products WHERE quantity < 10 OR price > 50000;
SELECT * FROM products WHERE category = 'Mobile' AND price > 30000;
SELECT * FROM products WHERE brand = 'Samsung' OR brand = 'Apple';
SELECT * FROM products WHERE city = 'Pune' AND status = 'Available' AND quantity > 10;

-- Task 41-50: Higher Operator Logic
SELECT * FROM products WHERE price BETWEEN 25000 AND 50000;
SELECT * FROM products WHERE quantity BETWEEN 5 AND 15;
SELECT * FROM products WHERE category IN ('Mobile', 'Laptop', 'Tablet');
SELECT * FROM products WHERE city IN ('Pune', 'Mumbai');
SELECT * FROM products WHERE brand <> 'Samsung';
SELECT * FROM products WHERE status <> 'Out of Stock';
SELECT * FROM products WHERE price <> 30000;
SELECT * FROM products WHERE product_name LIKE 'Galaxy%';
SELECT * FROM products WHERE product_name LIKE '%Pad%';
SELECT * FROM products WHERE category = 'Mobile' AND (price > 30000 OR quantity > 15);

-- Temporarily permits multi-row update/delete practice statements in Workbench.
SET SQL_SAFE_UPDATES = 0;

-- Task 51-56: UPDATE Operations
UPDATE products SET price = 34000 WHERE product_id = 201;
UPDATE products SET quantity = 12 WHERE product_id = 202;
UPDATE products SET status = 'Available' WHERE product_id = 206;
UPDATE products SET price = price + 2000 WHERE category = 'Mobile';
UPDATE products SET quantity = quantity + 5 WHERE city = 'Pune';
UPDATE products SET status = 'Out of Stock' WHERE quantity < 5;

-- Task 57-60: DELETE Operations
DELETE FROM products WHERE product_id = 210;
DELETE FROM products WHERE price < 8000;
DELETE FROM products WHERE status = 'Out of Stock' AND quantity < 5;
DELETE FROM products WHERE category = 'Tablet' AND price > 30000;

SET SQL_SAFE_UPDATES = 1;
