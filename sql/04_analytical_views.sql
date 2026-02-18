-- Monthly revenue view
CREATE VIEW v_monthly_revenue AS
SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS order_month,
    SUM(revenue) AS monthly_revenue,
    SUM(is_returned) AS total_returns,
    COUNT(order_id) AS total_orders
FROM staging_ecommerce
GROUP BY order_month;

-- Category performance view
CREATE VIEW v_category_performance AS
SELECT 
    product_category,
    SUM(revenue) AS total_revenue,
    COUNT(order_id) AS total_orders,
    ROUND(SUM(is_returned)/COUNT(order_id)*100,2) AS return_rate_percent
FROM staging_ecommerce
GROUP BY product_category;

-- Customer value view
CREATE VIEW v_customer_value AS
SELECT 
    customer_id,
    SUM(revenue) AS lifetime_value,
    COUNT(order_id) AS total_orders
FROM staging_ecommerce
GROUP BY customer_id;
-- region_performance
CREATE VIEW v_region_performance AS
SELECT 
    region,
    SUM(revenue) AS total_revenue,
    COUNT(order_id) AS total_orders,
    ROUND(SUM(is_returned)/COUNT(order_id)*100,2) AS return_rate_percent
FROM staging_ecommerce
GROUP BY product_category;