--Now return each user's second purchase and the days elapsed since there first.
with user_details as (
  select 
   user_id,
   total_amount,
   transaction_date,
   row_number() over(partition by user_id order by transaction_date asc) as rnk,
   lag(transaction_date) over(partition by user_id order by transaction_date asc) as prv_txn_date --uses lag to get the previous transaction
  from transactions
)
select
  user_id,
  total_amount,
  transaction_date,
  prv_txn_date,
  datediff(day, prv_txn_date, transaction_date) as days_elaped_since_first_purchase --uses datediff(day, prv_txn, curr_txn) to get the days
from user_details
where rnk = 2;
