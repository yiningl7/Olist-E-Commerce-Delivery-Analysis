SELECT
  -- Overall Totals
  SUM(total_orders) AS total_orders,
  SUM(total_items_sold) AS total_items_sold,
  ROUND(SUM(total_revenue), 2) AS total_revenue,
  -- Overall Aggregated AOV & Items per Order
  ROUND(SAFE_DIVIDE(SUM(total_revenue), SUM(total_orders)), 2) AS overall_aov,
  ROUND(SAFE_DIVIDE(SUM(total_items_sold), SUM(total_orders)), 2) AS overall_items_per_order
FROM `lewagonyining.olist.olist_seller_performance_by_region_view`;
