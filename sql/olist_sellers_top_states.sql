SELECT seller_state,
ROUND(SUM(total_revenue), 2) AS total_revenue
FROM `lewagonyining.olist.olist_seller_performance_by_region_view`
GROUP BY seller_state
ORDER BY total_revenue DESC;
