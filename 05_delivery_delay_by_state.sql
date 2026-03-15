-- 5. For each state, find the average delivery delay in days 
-- (actual delivery minus estimated delivery). Show only states that are late on average (delay > 0)
use my_olist;
select 
	c.customer_state,
    round(avg(datediff(o.order_estimated_delivery_date , o.order_delivered_customer_date)),1) as average_delay_days,
    count(*) as total_orders
from olist_orders o
join olist_customers c on o.customer_id = c.customer_id
where o.order_status = 'delivered'
and o.order_delivered_customer_date is not null
and o.order_estimated_delivery_date is not null
group by c.customer_state
having average_delay_days >0
order by average_delay_days desc;

