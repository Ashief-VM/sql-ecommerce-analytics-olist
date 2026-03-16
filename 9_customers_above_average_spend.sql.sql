-- Find customers who have spent MORE than the average customer spend. 
-- Return customer_unique_id, global average spend and their total spend, ordered highest first.

with customer_spend as(
select
	c.customer_unique_id,
    round((sum(p.payment_value)),2) as total_spend,
	round(avg(sum(p.payment_value)) over() ,2) as global_avg_spend
from olist_customers c
join olist_orders o 
	on o.customer_id = c.customer_id
join olist_order_payments p 
	on o.order_id = p.order_id
group by c.customer_unique_id
)
select *
from customer_spend
where total_spend > ( select avg (total_spend) from customer_spend)
order by total_spend desc;
	
    