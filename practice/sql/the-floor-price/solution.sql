select 
  upper(provider) as provider,
  amount
from cloud_costs
where acct_id is not null
qualify row_number() over(partition by upper(provider) order by amount desc) = 1;
