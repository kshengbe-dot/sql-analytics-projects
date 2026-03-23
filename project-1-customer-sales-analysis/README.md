# Customer Sales Analysis (MySQL Project)

## Overview
This project analyzes customer purchases, product performance, and revenue trends using SQL.

## Objectives
- Understand customer buying behavior
- Identify top-performing products
- Analyze revenue across categories and cities
- Generate business insights from transactional data

## Database Structure
- Customers table
- Products table
- Sales table

## Key SQL Concepts Used
- Joins
- Aggregations (SUM, AVG)
- GROUP BY
- Subqueries
- Filtering and sorting

## Key Insights
- Electronics generated the highest revenue
- High-value customers contributed most of the revenue
- Revenue varies significantly by city
- Monthly sales trends provide insight into business performance

## Sample Query
SELECT 
    p.product_name,
    SUM(p.price * s.quantity) AS total_revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_revenue DESC;

## Project Files
- schema.sql
- data_cleaning.sql
- analysis_queries.sql
- insights.md
- screenshots/
