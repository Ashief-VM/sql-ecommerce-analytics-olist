-- 4. Classify each order's payment into: 'card' (credit_card), 'voucher' (voucher), 'other' (everything else). 
-- Count orders and total payment value per bucket per month.

select
	date_format(o.order_purchase_timestamp , '%Y-m%') as month,
    case
		when p.payment_type = 'credit_card' then 'card'
        when p.payment_type = 'voucher' then 'voucher'
		else 'other'
    end as payment_bucket,
	count(distinct o.order_id) as total_orders,
	round(sum(p.payment_value) , 2) as total_value
from  olist_orders o 
join olist_order_payments p on o.order_id = p.order_id
group by 
	month, payment_bucket
order by month, total_value desc;
