INSERT INTO warehouse.fact_order_items (
    order_id,
    order_item_id,
    customer_sk,
    product_sk,
    seller_sk,
    order_status_sk,
    review_sk,
    purchase_date_sk,
    approved_date_sk,
    delivered_customer_date_sk,
    estimated_delivery_date_sk,
    price,
    freight_value,
    item_total_value,
    delivery_days,
    estimated_delivery_days,
    delivery_delay_days,
    delivered_on_time
)
SELECT
    oi.order_id,
    oi.order_item_id,
    dc.customer_sk,
    dp.product_sk,
    ds.seller_sk,
    dos.order_status_sk,
    dr.review_sk,
    TO_CHAR(o.order_purchase_timestamp::date, 'YYYYMMDD')::INTEGER AS purchase_date_sk,
    CASE
        WHEN o.order_approved_at IS NOT NULL
        THEN TO_CHAR(o.order_approved_at::date, 'YYYYMMDD')::INTEGER
        ELSE NULL
    END,
    CASE
        WHEN o.order_delivered_customer_date IS NOT NULL
        THEN TO_CHAR(o.order_delivered_customer_date::date, 'YYYYMMDD')::INTEGER
        ELSE NULL
    END,
    CASE
        WHEN o.order_estimated_delivery_date IS NOT NULL
        THEN TO_CHAR(o.order_estimated_delivery_date::date, 'YYYYMMDD')::INTEGER
        ELSE NULL
    END,
    oi.price,
    oi.freight_value,
    oi.item_total_value,
    o.delivery_days,
    o.estimated_delivery_days,
    o.delivery_delay_days,
    o.delivered_on_time
FROM staging.order_items oi
JOIN staging.orders o
    ON oi.order_id = o.order_id
LEFT JOIN warehouse.dim_customers dc
    ON o.customer_id = dc.customer_id
LEFT JOIN warehouse.dim_products dp
    ON oi.product_id = dp.product_id
LEFT JOIN warehouse.dim_sellers ds
    ON oi.seller_id = ds.seller_id
LEFT JOIN warehouse.dim_order_status dos
    ON o.order_status = dos.order_status
LEFT JOIN warehouse.dim_reviews dr
    ON oi.order_id = dr.order_id;