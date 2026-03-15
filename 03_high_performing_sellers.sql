-- 3. Which sellers have delivered more than 100 orders successfully? 
-- Show seller_id, seller_city, and count of delivered orders.

select 
    s.seller_id,
    s.seller_city,
    count(distinct o.order_id) as delivered_orders
from olist_sellers s 
join olist_order_items i on s.seller_id = i.seller_id
join  olist_orders o on i.order_id = o.order_id
where o.order_status = 'delivered'
group by s.seller_id , s.seller_city
having count(distinct o.order_id) > 100
order by delivered_orders
limit 10; 