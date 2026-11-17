select 
 user_id,
 total_amount,
 transaction_date
from transactions
qualify row_number() over(partition by user_id order by transaction_date asc) = 2;
