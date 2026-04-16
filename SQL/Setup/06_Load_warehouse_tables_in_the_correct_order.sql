INSERT INTO warehouse.dim_customers (
    customer_id,
    customer_unique_id,
    customer_zip_code_prefix,
    customer_city,
    customer_state
)
SELECT
    customer_id,
    customer_unique_id,
    customer_zip_code_prefix,
    customer_city,
    customer_state
FROM staging.customers;

INSERT INTO warehouse.dim_products (
    product_id,
    product_category_name,
    product_category_name_english,
    product_name_lenght,
    product_description_lenght,
    product_photos_qty,
    product_weight_g,
    product_length_cm,
    product_height_cm,
    product_width_cm
)
SELECT
    product_id,
    product_category_name,
    product_category_name_english,
    product_name_lenght,
    product_description_lenght,
    product_photos_qty,
    product_weight_g,
    product_length_cm,
    product_height_cm,
    product_width_cm
FROM staging.products;

INSERT INTO warehouse.dim_sellers (
    seller_id,
    seller_zip_code_prefix,
    seller_city,
    seller_state
)
SELECT
    seller_id,
    seller_zip_code_prefix,
    seller_city,
    seller_state
FROM staging.sellers;

INSERT INTO warehouse.dim_order_status (
    order_status
)
SELECT DISTINCT order_status
FROM staging.orders
ORDER BY order_status;

INSERT INTO warehouse.dim_reviews (
    order_id,
    review_id,
    review_score,
    review_creation_date,
    review_answer_timestamp,
    review_comment_title,
    review_comment_message
)
SELECT DISTINCT ON (order_id)
    order_id,
    review_id,
    review_score,
    review_creation_date,
    review_answer_timestamp,
    review_comment_title,
    review_comment_message
FROM staging.order_reviews
ORDER BY order_id, review_answer_timestamp DESC NULLS LAST, review_creation_date DESC NULLS LAST;

INSERT INTO warehouse.dim_date (
    date_sk,
    full_date,
    year,
    quarter,
    month,
    month_name,
    day,
    day_of_week,
    day_name
)
SELECT
    TO_CHAR(d::date, 'YYYYMMDD')::INTEGER AS date_sk,
    d::date AS full_date,
    EXTRACT(YEAR FROM d)::INTEGER AS year,
    EXTRACT(QUARTER FROM d)::INTEGER AS quarter,
    EXTRACT(MONTH FROM d)::INTEGER AS month,
    TO_CHAR(d, 'FMMonth') AS month_name,
    EXTRACT(DAY FROM d)::INTEGER AS day,
    EXTRACT(DOW FROM d)::INTEGER AS day_of_week,
    TO_CHAR(d, 'FMDay') AS day_name
FROM generate_series(
    (SELECT MIN(order_purchase_timestamp::date) FROM staging.orders),
    (SELECT MAX(order_estimated_delivery_date::date) FROM staging.orders),
    interval '1 day'
) AS d;