# Olist E-commerce: Delivery & Operational Performance (SQL)

## Business question
Where do delays happen in Olist's order fulfilment process, and how does seller location affect delivery performance?

## Data & tools
Olist Brazilian e-commerce public dataset (2016–2018), ~99,000 orders across order, seller, and customer tables. Analysis in SQL (Google BigQuery).

## Definitions
- **Order stages:** purchase → approval → carrier dispatch → customer delivery, measured in days.
- **Slower than average:** an order's stage duration exceeds the mean for that stage across all delivered orders.
- **Delayed / early:** an order's actual delivery date and estimated delivery date difference. 

## Key findings
- 37.1% of orders took longer than the average dispatch-to-delivery time, while order approval was relatively fast, so delays are concentrated in the delivery stage.
- Over 60% of seller revenue and order volume is concentrated in São Paulo (SP), and 7 of the top 10 sellers are based there.

## Recommendations
- Partner with sellers to synchronise warehouse processing times and share realistic timelines with customers.
- Incentivise seller recruitment outside São Paulo to decentralise fulfilment and shorten cross-country shipping.
- Add checkout recommendations to raise average items per order above 1.13.

## Next steps
- Analyse which product categories drive the longest dispatch delays.
- Measure the correlation between delivery delays and customer review scores.

## Repository contents
- `sql/olist_orders_dates.sql`: days spent in each order stage and orders above the stage average
- `sql/olist_orders_delivery_diff.sql`: the difference between estimated and actual delivery dates
- `sql/olist_seller_performance_by_region.sql`: kpis, including total orders, total items sold, total revenue, average item price and freight, by region
- `sql/olist_sellers_performance_kpi.sql`: kpis, including total orders, aggregated aov and items per order, by region
- `sql/olist_sellers_top_states.sql`: top performing states order by total revenue
- `Olist_Delivery_Analysis_Slides.pdf`: final presentation
