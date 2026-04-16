DROP TABLE IF EXISTS warehouse.fact_order_items;
DROP TABLE IF EXISTS warehouse.dim_reviews;
DROP TABLE IF EXISTS warehouse.dim_date;
DROP TABLE IF EXISTS warehouse.dim_order_status;
DROP TABLE IF EXISTS warehouse.dim_sellers;
DROP TABLE IF EXISTS warehouse.dim_products;
DROP TABLE IF EXISTS warehouse.dim_customers;

CREATE TABLE warehouse.dim_customers (
    customer_sk BIGSERIAL PRIMARY KEY,
    customer_id VARCHAR(50) UNIQUE NOT NULL,
    customer_unique_id VARCHAR(50),
    customer_zip_code_prefix INTEGER,
    customer_city VARCHAR(100),
    customer_state VARCHAR(10)
);

CREATE TABLE warehouse.dim_products (
    product_sk BIGSERIAL PRIMARY KEY,
    product_id VARCHAR(50) UNIQUE NOT NULL,
    product_category_name VARCHAR(100),
    product_category_name_english VARCHAR(100),
    product_name_lenght NUMERIC(10,2),
    product_description_lenght NUMERIC(10,2),
    product_photos_qty NUMERIC(10,2),
    product_weight_g NUMERIC(12,2),
    product_length_cm NUMERIC(12,2),
    product_height_cm NUMERIC(12,2),
    product_width_cm NUMERIC(12,2)
);

CREATE TABLE warehouse.dim_sellers (
    seller_sk BIGSERIAL PRIMARY KEY,
    seller_id VARCHAR(50) UNIQUE NOT NULL,
    seller_zip_code_prefix INTEGER,
    seller_city VARCHAR(100),
    seller_state VARCHAR(10)
);

CREATE TABLE warehouse.dim_order_status (
    order_status_sk BIGSERIAL PRIMARY KEY,
    order_status VARCHAR(30) UNIQUE NOT NULL
);

CREATE TABLE warehouse.dim_reviews (
    review_sk BIGSERIAL PRIMARY KEY,
    order_id VARCHAR(50) UNIQUE NOT NULL,
    review_id VARCHAR(50),
    review_score INTEGER,
    review_creation_date TIMESTAMP,
    review_answer_timestamp TIMESTAMP,
    review_comment_title TEXT,
    review_comment_message TEXT
);

CREATE TABLE warehouse.dim_date (
    date_sk INTEGER PRIMARY KEY,
    full_date DATE UNIQUE NOT NULL,
    year INTEGER,
    quarter INTEGER,
    month INTEGER,
    month_name VARCHAR(20),
    day INTEGER,
    day_of_week INTEGER,
    day_name VARCHAR(20)
);

CREATE TABLE warehouse.fact_order_items (
    fact_order_item_sk BIGSERIAL PRIMARY KEY,
    order_id VARCHAR(50) NOT NULL,
    order_item_id INTEGER NOT NULL,
    customer_sk BIGINT,
    product_sk BIGINT,
    seller_sk BIGINT,
    order_status_sk BIGINT,
    review_sk BIGINT,
    purchase_date_sk INTEGER,
    approved_date_sk INTEGER,
    delivered_customer_date_sk INTEGER,
    estimated_delivery_date_sk INTEGER,
    price NUMERIC(12,2),
    freight_value NUMERIC(12,2),
    item_total_value NUMERIC(12,2),
    delivery_days INTEGER,
    estimated_delivery_days INTEGER,
    delivery_delay_days INTEGER,
    delivered_on_time BOOLEAN,
    CONSTRAINT fk_fact_customer FOREIGN KEY (customer_sk) REFERENCES warehouse.dim_customers(customer_sk),
    CONSTRAINT fk_fact_product FOREIGN KEY (product_sk) REFERENCES warehouse.dim_products(product_sk),
    CONSTRAINT fk_fact_seller FOREIGN KEY (seller_sk) REFERENCES warehouse.dim_sellers(seller_sk),
    CONSTRAINT fk_fact_order_status FOREIGN KEY (order_status_sk) REFERENCES warehouse.dim_order_status(order_status_sk),
    CONSTRAINT fk_fact_review FOREIGN KEY (review_sk) REFERENCES warehouse.dim_reviews(review_sk),
    CONSTRAINT fk_fact_purchase_date FOREIGN KEY (purchase_date_sk) REFERENCES warehouse.dim_date(date_sk),
    CONSTRAINT fk_fact_approved_date FOREIGN KEY (approved_date_sk) REFERENCES warehouse.dim_date(date_sk),
    CONSTRAINT fk_fact_delivered_customer_date FOREIGN KEY (delivered_customer_date_sk) REFERENCES warehouse.dim_date(date_sk),
    CONSTRAINT fk_fact_estimated_delivery_date FOREIGN KEY (estimated_delivery_date_sk) REFERENCES warehouse.dim_date(date_sk)
);