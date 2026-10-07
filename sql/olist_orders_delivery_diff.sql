WITH cte_olist_orders_delivered AS (
SELECT
  EXTRACT (YEAR FROM order_purchase_timestamp) AS order_purchase_year,
  DATE_DIFF (order_estimated_delivery_date, order_delivered_customer_date, DAY) AS delivery_diff_days #>0 means late, <0 means early
FROM `lewagonyining.olist.olist_orders_dataset`
WHERE order_status = "delivered"
)

SELECT
  order_purchase_year,
  COUNTIF(delivery_diff_days > 0) AS late_orders_count,
  ROUND(AVG(CASE WHEN delivery_diff_days > 0 THEN delivery_diff_days END), 2) AS avg_days_late,
  COUNTIF(delivery_diff_days < 0) AS early_orders_count,
  ROUND(AVG(CASE WHEN delivery_diff_days < 0 THEN delivery_diff_days END), 2) AS avg_days_early
FROM cte_olist_orders_delivered
GROUP BY order_purchase_year
