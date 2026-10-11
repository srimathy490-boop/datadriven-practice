with cte as (
select username, count(case when total_amount > 0 then total_amount end) as txn_count
from transactions t join users u
on t.user_id=u.user_id
group by username)
select 
  username,
  txn_count,
  dense_rank() over( order by txn_count desc) as tier
from cte
qualify dense_rank() over( order by txn_count desc) <=2;




-- select * from transactions where user_id=100;
