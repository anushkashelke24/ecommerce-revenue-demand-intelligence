CREATE TABLE staging_ecommerce (
    order_id INT,
    order_date DATE,
    customer_id INT,
    product_category VARCHAR(50),
    region VARCHAR(50),
    revenue DECIMAL(10,2),
    discount_percent DECIMAL(5,2),
    is_returned INT
);
