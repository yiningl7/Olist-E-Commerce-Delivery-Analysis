SELECT
  seller.seller_state,
  seller.seller_city,
  COUNT(DISTINCT orders.order_id) AS total_orders,
  COUNT(item.order_item_id) AS total_items_sold,
  ROUND(SUM(item.price), 2) AS total_revenue,
  ROUND(AVG(item.price), 2) AS average_item_price,
  ROUND(AVG(item.freight_value), 2) AS average_freight_value
FROM `lewagonyining.olist.olist_sellers_dataset` seller
JOIN `lewagonyining.olist.olist_order_items_dataset` item
ON seller.seller_id = item.seller_id
JOIN `lewagonyining.olist.olist_orders_dataset` orders
ON item.order_id = orders.order_id
WHERE orders.order_status = 'delivered'
GROUP BY
  seller.seller_state,
  seller.seller_city
ORDER BY total_revenue DESC;
