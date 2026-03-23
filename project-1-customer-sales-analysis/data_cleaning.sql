USE customer_sales_db;

-- Check for null values
SELECT * FROM customers
WHERE customer_name IS NULL OR city IS NULL OR signup_date IS NULL;

SELECT * FROM products
WHERE product_name IS NULL OR category IS NULL OR price IS NULL;

SELECT * FROM sales
WHERE customer_id IS NULL OR product_id IS NULL OR quantity IS NULL OR sale_date IS NULL;

-- Check for duplicate primary keys
SELECT customer_id, COUNT(*)
FROM customers
GROUP BY customer_id
HAVING COUNT(*) > 1;

SELECT product_id, COUNT(*)
FROM products
GROUP BY product_id
HAVING COUNT(*) > 1;

SELECT sale_id, COUNT(*)
FROM sales
GROUP BY sale_id
HAVING COUNT(*) > 1;

-- Check for invalid quantities or prices
SELECT * FROM sales
WHERE quantity <= 0;

SELECT * FROM products
WHERE price <= 0;

-- Standardization example
UPDATE customers
SET city = TRIM(city);

UPDATE products
SET category = TRIM(category);
