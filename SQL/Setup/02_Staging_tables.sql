DROP TABLE IF EXISTS staging.category_translation;
DROP TABLE IF EXISTS staging.sellers;
DROP TABLE IF EXISTS staging.products;
DROP TABLE IF EXISTS staging.orders;
DROP TABLE IF EXISTS staging.order_reviews;
DROP TABLE IF EXISTS staging.order_payments;
DROP TABLE IF EXISTS staging.order_items;
DROP TABLE IF EXISTS staging.geolocation;
DROP TABLE IF EXISTS staging.customers;

CREATE TABLE staging.customers (
    customer_id VARCHAR(50),
    customer_unique_id VARCHAR(50),
    customer_zip_code_prefix INTEGER,
    customer_city VARCHAR(100),
    customer_state VARCHAR(10)
);

CREATE TABLE staging.geolocation (
    geolocation_zip_code_prefix INTEGER,
    geolocation_lat NUMERIC(12,8),
    geolocation_lng NUMERIC(12,8),
    geolocation_city VARCHAR(100),
    geolocation_state VARCHAR(10)
);

CREATE TABLE staging.order_items (
    order_id VARCHAR(50),
    order_item_id INTEGER,
    product_id VARCHAR(50),
    seller_id VARCHAR(50),
    shipping_limit_date TIMESTAMP,
    price NUMERIC(12,2),
    freight_value NUMERIC(12,2),
    item_total_value NUMERIC(12,2)
);

CREATE TABLE staging.order_payments (
    order_id VARCHAR(50),
    payment_sequential INTEGER,
    payment_type VARCHAR(50),
    payment_installments INTEGER,
    payment_value NUMERIC(12,2)
);

CREATE TABLE staging.order_reviews (
    review_id VARCHAR(50),
    order_id VARCHAR(50),
    review_score INTEGER,
    review_comment_title TEXT,
    review_comment_message TEXT,
    review_creation_date TIMESTAMP,
    review_answer_timestamp TIMESTAMP
);

CREATE TABLE staging.orders (
    order_id VARCHAR(50),
    customer_id VARCHAR(50),
    order_status VARCHAR(30),
    order_purchase_timestamp TIMESTAMP,
    order_approved_at TIMESTAMP,
    order_delivered_carrier_date TIMESTAMP,
    order_delivered_customer_date TIMESTAMP,
    order_estimated_delivery_date TIMESTAMP,
    delivery_days INTEGER,
    estimated_delivery_days INTEGER,
    delivered_on_time BOOLEAN,
    delivery_delay_days INTEGER
);

CREATE TABLE staging.products (
    product_id VARCHAR(50),
    product_category_name VARCHAR(100),
    product_name_lenght NUMERIC(10,2),
    product_description_lenght NUMERIC(10,2),
    product_photos_qty NUMERIC(10,2),
    product_weight_g NUMERIC(12,2),
    product_length_cm NUMERIC(12,2),
    product_height_cm NUMERIC(12,2),
    product_width_cm NUMERIC(12,2),
    product_category_name_english VARCHAR(100)
);

CREATE TABLE staging.sellers (
    seller_id VARCHAR(50),
    seller_zip_code_prefix INTEGER,
    seller_city VARCHAR(100),
    seller_state VARCHAR(10)
);

CREATE TABLE staging.category_translation (
    product_category_name VARCHAR(100),
    product_category_name_english VARCHAR(100)
);