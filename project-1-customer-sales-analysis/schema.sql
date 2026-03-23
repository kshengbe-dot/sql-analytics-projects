CREATE DATABASE IF NOT EXISTS customer_sales_db;
USE customer_sales_db;

DROP TABLE IF EXISTS sales;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS products;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    signup_date DATE
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    sale_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO customers (customer_id, customer_name, city, signup_date) VALUES
(1, 'Alice Johnson', 'New York', '2024-01-15'),
(2, 'Bob Smith', 'Los Angeles', '2024-02-10'),
(3, 'Carol Davis', 'Chicago', '2024-03-05'),
(4, 'David Brown', 'Houston', '2024-03-20'),
(5, 'Eva Green', 'Phoenix', '2024-04-01');

INSERT INTO products (product_id, product_name, category, price) VALUES
(101, 'Laptop', 'Electronics', 1200.00),
(102, 'Phone', 'Electronics', 800.00),
(103, 'Desk Chair', 'Furniture', 150.00),
(104, 'Notebook', 'Stationery', 5.00),
(105, 'Backpack', 'Accessories', 45.00);

INSERT INTO sales (sale_id, customer_id, product_id, quantity, sale_date) VALUES
(1001, 1, 101, 1, '2024-05-01'),
(1002, 2, 102, 2, '2024-05-03'),
(1003, 3, 103, 1, '2024-05-04'),
(1004, 1, 104, 10, '2024-05-06'),
(1005, 4, 105, 2, '2024-05-07'),
(1006, 5, 101, 1, '2024-05-08'),
(1007, 2, 103, 1, '2024-05-09'),
(1008, 3, 105, 3, '2024-05-10'),
(1009, 4, 102, 1, '2024-05-11'),
(1010, 5, 104, 20, '2024-05-12');
