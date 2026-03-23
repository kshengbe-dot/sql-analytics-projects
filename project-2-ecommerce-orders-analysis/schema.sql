DROP DATABASE IF EXISTS ecommerce_orders_db;
CREATE DATABASE ecommerce_orders_db;
USE ecommerce_orders_db;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(50),
    signup_date DATE
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    order_status VARCHAR(30),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO customers VALUES
(1, 'Alice Johnson', 'alice@email.com', 'New York', '2024-01-10'),
(2, 'Bob Smith', 'bob@email.com', 'Los Angeles', '2024-01-15'),
(3, 'Carol Davis', 'carol@email.com', 'Chicago', '2024-02-01'),
(4, 'David Brown', 'david@email.com', 'Houston', '2024-02-10'),
(5, 'Eva Green', 'eva@email.com', 'Phoenix', '2024-03-01');

INSERT INTO products VALUES
(101, 'Laptop', 'Electronics', 1200.00),
(102, 'Phone', 'Electronics', 800.00),
(103, 'Headphones', 'Electronics', 150.00),
(104, 'Desk Chair', 'Furniture', 200.00),
(105, 'Notebook Pack', 'Stationery', 20.00),
(106, 'Backpack', 'Accessories', 50.00);

INSERT INTO orders VALUES
(1001, 1, '2024-05-01', 'Completed'),
(1002, 2, '2024-05-02', 'Completed'),
(1003, 3, '2024-05-03', 'Completed'),
(1004, 1, '2024-05-05', 'Completed'),
(1005, 4, '2024-05-06', 'Cancelled'),
(1006, 5, '2024-05-07', 'Completed'),
(1007, 2, '2024-05-08', 'Completed'),
(1008, 3, '2024-05-10', 'Completed');

INSERT INTO order_items VALUES
(1, 1001, 101, 1),
(2, 1001, 105, 2),
(3, 1002, 102, 1),
(4, 1002, 103, 1),
(5, 1003, 104, 1),
(6, 1003, 106, 2),
(7, 1004, 105, 5),
(8, 1004, 106, 1),
(9, 1005, 102, 1),
(10, 1006, 101, 1),
(11, 1006, 103, 2),
(12, 1007, 104, 1),
(13, 1007, 105, 3),
(14, 1008, 106, 2),
(15, 1008, 103, 1);
