-- Question 1:
-- Which product categories generate the most orders and revenue?


-- Top 10 categories by orders 
-- only on delivered orders
SELECT
    dp.product_category_name_english AS product_category,
    COUNT(DISTINCT f.order_id) AS total_orders,
    ROUND(SUM(f.item_total_value), 2) AS total_revenue    
FROM warehouse.fact_order_items f
LEFT JOIN warehouse.dim_products dp ON f.product_sk = dp.product_sk
LEFT JOIN warehouse.dim_order_status dos ON f.order_status_sk = dos.order_status_sk
WHERE dos.order_status = 'delivered'
GROUP BY dp.product_category_name_english
ORDER BY total_orders DESC
LIMIT 10;


-- Top 10 categories by revenue 
-- only on delivered orders
SELECT
    dp.product_category_name_english AS product_category,
    COUNT(DISTINCT f.order_id) AS total_orders,
    ROUND(SUM(f.item_total_value), 2) AS total_revenue
FROM warehouse.fact_order_items f
LEFT JOIN warehouse.dim_products dp ON f.product_sk = dp.product_sk
LEFT JOIN warehouse.dim_order_status dos ON f.order_status_sk = dos.order_status_sk
WHERE dos.order_status = 'delivered'
GROUP BY dp.product_category_name_english
ORDER BY total_revenue DESC
LIMIT 10;

