-- 1. Find the total revenue (price + freight) per product category. 
-- Show only the top 10 categories by total revenue, ordered highest first.

use my_olist;

select 
	t.product_category_name_english as category,
    round(sum(i.price + i.freight_value) ,  2) as total_price,
    count(distinct i.order_id) as total_orders
from olist_order_items i 
join olist_products p on i.product_id = p.product_id
join product_category_name_translation t on p.product_category_name = t.product_category_name
group by t.product_category_name_english
order by total_price desc
limit 10;