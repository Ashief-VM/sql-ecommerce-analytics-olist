-- Get the FIRST order for each unique customer based on purchase timestamp.
-- (Deduplication pattern — used constantly in data cleaning)

with ranked_date as(
select 
	c.customer_unique_id,
    o.order_id,
	o.order_purchase_timestamp as purchase_date,
    rank() over(partition by c.customer_unique_id order by o.order_purchase_timestamp asc) as rnk
from olist_customers c
join olist_orders o on c.customer_id = o.customer_id

)
select
	customer_unique_id,
    order_id,
    purchase_date,
    rnk
from ranked_date
where rnk = 1 
order by customer_unique_id, rnk;
