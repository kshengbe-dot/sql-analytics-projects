USE ecommerce_orders_db;

SELECT * FROM customers
WHERE customer_name IS NULL OR email IS NULL OR city IS NULL OR signup_date IS NULL;

SELECT * FROM products
WHERE product_name IS NULL OR category IS NULL OR price IS NULL;

SELECT * FROM orders
WHERE customer_id IS NULL OR order_date IS NULL OR order_status IS NULL;

SELECT * FROM order_items
WHERE order_id IS NULL OR product_id IS NULL OR quantity IS NULL;

SELECT customer_id, COUNT(*)
FROM customers
GROUP BY customer_id
HAVING COUNT(*) > 1;

SELECT product_id, COUNT(*)
FROM products
GROUP BY product_id
HAVING COUNT(*) > 1;

SELECT order_id, COUNT(*)
FROM orders
GROUP BY order_id
HAVING COUNT(*) > 1;

SELECT order_item_id, COUNT(*)
FROM order_items
GROUP BY order_item_id
HAVING COUNT(*) > 1;

SELECT * FROM products
WHERE price <= 0;

SELECT * FROM order_items
WHERE quantity <= 0;

UPDATE customers
SET city = TRIM(city),
    email = TRIM(email);

UPDATE products
SET category = TRIM(category);

UPDATE orders
SET order_status = TRIM(order_status);
