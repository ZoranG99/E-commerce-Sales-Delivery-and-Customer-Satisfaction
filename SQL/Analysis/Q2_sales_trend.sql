-- Question 2:
-- How do monthly revenue and monthly order volume change over time for delivered orders?

SELECT
    dd.year,
    dd.month,
    CONCAT(dd.year, '-', LPAD(dd.month::text, 2, '0')) AS year_month,
    COUNT(DISTINCT f.order_id) AS total_orders,
    ROUND(SUM(f.item_total_value), 2) AS total_revenue    
FROM warehouse.fact_order_items f
LEFT JOIN warehouse.dim_date dd ON f.purchase_date_sk = dd.date_sk
LEFT JOIN warehouse.dim_order_status dos ON f.order_status_sk = dos.order_status_sk
WHERE dos.order_status = 'delivered'
GROUP BY
    dd.year,
    dd.month
ORDER BY
    dd.year,
    dd.month;



