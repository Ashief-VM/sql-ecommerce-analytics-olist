-- For each seller, show: total revenue, total orders, count of 1-star reviews, 
-- count of 5-star reviews, and % of orders that are 5-star. 
-- Only include sellers with at least 50 orders.


SELECT 
    i.seller_id AS sellers,
    ROUND(SUM(i.price + i.freight_value), 2) AS total_revenue,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(CASE
        WHEN r.review_score = 1 THEN 1
        ELSE 0
    END) AS 1_star,
    SUM(CASE
        WHEN r.review_score = 5 THEN 1
        ELSE 0
    END) AS 5_star,
    ROUND(100.0 * SUM(CASE
                WHEN r.review_score = 5 THEN 1
                ELSE 0
            END) / COUNT(DISTINCT o.order_id),
            2) AS percent_of_5star
FROM
    olist_order_items i
        JOIN
    olist_orders o ON i.order_id = o.order_id
        JOIN
    olist_order_reviews r ON o.order_id = r.order_id
GROUP BY i.seller_id
HAVING total_orders >= 50
ORDER BY percent_of_5star DESC;



	