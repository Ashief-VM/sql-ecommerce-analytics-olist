-- 2. Find all customers who placed an order but never left a review. 
-- Return customer_unique_id and total orders placed.

select
	c.customer_unique_id as customers,
    count(distinct o.order_id) as total_orders
from olist_customers c
join olist_orders o on c.customer_id = o.customer_id
left join olist_order_reviews r on o.order_id = r.order_id
where r.review_score is null
group by customers
order by total_orders desc;
