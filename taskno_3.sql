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