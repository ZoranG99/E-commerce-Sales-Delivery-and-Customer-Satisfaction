-- Question 3:
-- How does delivery delay affect customer review scores for delivered orders?

SELECT
    dr.review_score,
    COUNT(DISTINCT f.order_id) AS total_orders,
    ROUND(AVG(f.delivery_delay_days), 2) AS avg_delivery_delay_days,
    ROUND(AVG(f.delivery_days), 2) AS avg_delivery_days,
    ROUND(
        100.0 * COUNT(DISTINCT CASE WHEN f.delivered_on_time = TRUE THEN f.order_id END)
        / COUNT(DISTINCT f.order_id),
        2
    ) AS on_time_delivery_rate_pct
FROM warehouse.fact_order_items f
LEFT JOIN warehouse.dim_reviews dr ON f.review_sk = dr.review_sk
LEFT JOIN warehouse.dim_order_status dos ON f.order_status_sk = dos.order_status_sk
WHERE dos.order_status = 'delivered'
  AND dr.review_score IS NOT NULL
  AND f.delivery_delay_days IS NOT NULL
  AND f.delivered_on_time IS NOT NULL
GROUP BY dr.review_score
ORDER BY dr.review_score;













