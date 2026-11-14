select
  user_id,
  sum(total_amount) as total_spend
from 
transactions
where transaction_date >= '2026-01-01'
group by user_id
order by total_spend desc;
