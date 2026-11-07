select
  to_char(bill_date,'YYYY-MM') as billing_month,
  sum(amount) as total_spend
from
  cloud_costs
group by billing_month
order by total_spend desc 
fetch first 1 row only;
