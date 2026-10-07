WITH cte_olist_orders_dates AS (
SELECT
  order_purchase_timestamp,
  order_approved_at,
  order_delivered_carrier_date,
  order_delivered_customer_date,
  DATE_DIFF (order_approved_at, order_purchase_timestamp, DAY) AS purchase_to_approval,
  DATE_DIFF (order_delivered_carrier_date, order_approved_at, DAY) AS approval_to_dispatch,
  DATE_DIFF (order_delivered_customer_date, order_delivered_carrier_date, DAY) AS dispatch_to_delivery
FROM `lewagonyining.olist.olist_orders_dataset`
WHERE order_status = "delivered"
),

cte_orders_with_averages AS (
  SELECT
    *,
    AVG(purchase_to_approval) OVER() AS avg_purchase_to_approval,
    AVG(approval_to_dispatch) OVER() AS avg_approval_to_dispatch,
    AVG(dispatch_to_delivery) OVER() AS avg_dispatch_to_delivery
  FROM cte_olist_orders_dates
)

SELECT
  ROUND(AVG(avg_purchase_to_approval), 2) AS overall_avg_approval_days,
  ROUND(AVG(avg_approval_to_dispatch), 2) AS overall_avg_dispatch_days,
  ROUND(AVG(avg_dispatch_to_delivery), 2) AS overall_avg_delivery_days,
  COUNTIF(purchase_to_approval > avg_purchase_to_approval) AS orders_exceeding_approval_avg,
  COUNTIF(approval_to_dispatch > avg_approval_to_dispatch) AS orders_exceeding_dispatch_avg,
  COUNTIF(dispatch_to_delivery > avg_dispatch_to_delivery) AS orders_exceeding_delivery_avg,
  COUNT(*) AS total_orders
FROM cte_orders_with_averages;
