-- Explore basic structure
SELECT *
FROM staging_ecommerce
LIMIT 10;

-- Check total records
SELECT COUNT(*) AS total_rows
FROM staging_ecommerce;

-- Check date range
SELECT 
    MIN(order_date) AS start_date,
    MAX(order_date) AS end_date
FROM staging_ecommerce;

-- Check for duplicate order IDs
SELECT order_id, COUNT(*)
FROM staging_ecommerce
GROUP BY order_id
HAVING COUNT(*) > 1;

-- Check for missing values in important columns
SELECT 
    SUM(CASE WHEN revenue IS NULL THEN 1 ELSE 0 END) AS missing_revenue,
    SUM(CASE WHEN order_date IS NULL THEN 1 ELSE 0 END) AS missing_date
FROM staging_ecommerce;
