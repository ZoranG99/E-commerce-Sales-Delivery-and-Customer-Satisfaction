SELECT 'dim_customers' AS table_name, COUNT(*) FROM warehouse.dim_customers
UNION ALL
SELECT 'dim_products', COUNT(*) FROM warehouse.dim_products
UNION ALL
SELECT 'dim_sellers', COUNT(*) FROM warehouse.dim_sellers
UNION ALL
SELECT 'dim_order_status', COUNT(*) FROM warehouse.dim_order_status
UNION ALL
SELECT 'dim_reviews', COUNT(*) FROM warehouse.dim_reviews
UNION ALL
SELECT 'dim_date', COUNT(*) FROM warehouse.dim_date
UNION ALL
SELECT 'fact_order_items', COUNT(*) FROM warehouse.fact_order_items;