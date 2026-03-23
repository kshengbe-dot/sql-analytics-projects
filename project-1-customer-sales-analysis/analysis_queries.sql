USE customer_sales_db;

-- 1. View all sales with customer and product details
SELECT 
    s.sale_id,
    c.customer_name,
    c.city,
    p.product_name,
    p.category,
    p.price,
    s.quantity,
    (p.price * s.quantity) AS total_amount,
    s.sale_date
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
JOIN products p ON s.product_id = p.product_id;

-- 2. Total revenue generated
SELECT 
    SUM(p.price * s.quantity) AS total_revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id;

-- 3. Revenue by product
SELECT 
    p.product_name,
    SUM(s.quantity) AS total_units_sold,
    SUM(p.price * s.quantity) AS total_revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_revenue DESC;

-- 4. Revenue by category
SELECT 
    p.category,
    SUM(p.price * s.quantity) AS total_revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.category
ORDER BY total_revenue DESC;

-- 5. Top customers by spending
SELECT 
    c.customer_name,
    SUM(p.price * s.quantity) AS total_spent
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
JOIN products p ON s.product_id = p.product_id
GROUP BY c.customer_name
ORDER BY total_spent DESC;

-- 6. Sales by city
SELECT 
    c.city,
    SUM(p.price * s.quantity) AS city_revenue
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
JOIN products p ON s.product_id = p.product_id
GROUP BY c.city
ORDER BY city_revenue DESC;

-- 7. Average order value
SELECT 
    AVG(order_total) AS average_order_value
FROM (
    SELECT 
        s.sale_id,
        SUM(p.price * s.quantity) AS order_total
    FROM sales s
    JOIN products p ON s.product_id = p.product_id
    GROUP BY s.sale_id
) AS order_summary;

-- 8. Customers who bought electronics
SELECT DISTINCT
    c.customer_name,
    p.category
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
JOIN products p ON s.product_id = p.product_id
WHERE p.category = 'Electronics';

-- 9. Best-selling product by quantity
SELECT 
    p.product_name,
    SUM(s.quantity) AS units_sold
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY units_sold DESC
LIMIT 1;

-- 10. Monthly revenue trend
SELECT 
    DATE_FORMAT(s.sale_date, '%Y-%m') AS sales_month,
    SUM(p.price * s.quantity) AS monthly_revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY DATE_FORMAT(s.sale_date, '%Y-%m')
ORDER BY sales_month;
