-- Show the number of orders placed each month and total revenue.
 -- Order by month ascending. THIS is the most common first query in any analytics challenge — memorise it.
 
use my_olist;

SELECT 
    DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m') AS month,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(i.price + i.freight_value), 2) AS total_revenue
FROM
    olist_orders o
        JOIN
    olist_order_items i ON o.order_id = i.order_id
GROUP BY month
ORDER BY month ASC;



