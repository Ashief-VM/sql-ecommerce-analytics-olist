-- Find product categories that have at least 500 orders AND an average review score below 3.5. 
-- High volume, low satisfaction categories — the ones a product team cares most about.

SELECT 
    COUNT(DISTINCT o.order_id) AS total_orders,
    t.product_category_name_english AS category,
    ROUND(AVG(r.review_score), 2) AS avg_review
FROM
    olist_order_items i
        JOIN
    olist_products p ON i.product_id = p.product_id
        JOIN
    product_category_name_translation t ON p.product_category_name = t.product_category_name
        JOIN
    olist_orders o ON i.order_id = o.order_id
        JOIN
    olist_order_reviews r ON o.order_id = r.order_id
GROUP BY category
HAVING COUNT(DISTINCT o.order_id) >= 500
    AND avg_review < 3.5
ORDER BY avg_review ASC;