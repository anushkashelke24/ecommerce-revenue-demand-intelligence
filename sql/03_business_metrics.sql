-- Overall revenue and return rate
SELECT 
    SUM(revenue) AS total_revenue,
    COUNT(order_id) AS total_orders,
    ROUND(SUM(is_returned)/COUNT(order_id)*100,2) AS return_rate_percent
FROM staging_ecommerce;

-- Revenue by region
SELECT 
    region,
    SUM(revenue) AS total_revenue
FROM staging_ecommerce
GROUP BY region
ORDER BY total_revenue DESC;

-- Category performance with return risk
SELECT 
    product_category,
    SUM(revenue) AS total_revenue,
    COUNT(order_id) AS total_orders,
    ROUND(SUM(is_returned)/COUNT(order_id)*100,2) AS return_rate_percent
FROM staging_ecommerce
GROUP BY product_category
ORDER BY return_rate_percent DESC;

-- Customer lifetime value
SELECT 
    customer_id,
    SUM(revenue) AS lifetime_value,
    COUNT(order_id) AS total_orders
FROM staging_ecommerce
GROUP BY customer_id
ORDER BY lifetime_value DESC
LIMIT 10;
