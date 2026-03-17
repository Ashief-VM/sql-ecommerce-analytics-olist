-- Rank sellers by total revenue within each state.
--  Show the top 3 sellers per state. (Regional leaderboard — very common in real dashboards)


use my_olist;

with seller_revenue as(
select
     s.seller_id,
    round(sum(i.price), 2) as total_revenue,
    s.seller_state
from olist_sellers s 
join olist_order_items i on s.seller_id = i.seller_id
group by s.seller_id, s.seller_state
),
ranked as (
select *,
rank() over (partition by seller_state order by total_revenue desc) as state_rank
from seller_revenue
)
 
select * from ranked
where state_rank < 4
order by seller_state , state_rank;










