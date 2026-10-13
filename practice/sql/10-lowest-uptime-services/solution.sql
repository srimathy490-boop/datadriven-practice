with least_reliable_per_service as (
select
  svc_name,
  uptime
from
  svc_health
qualify row_number() over(partition by svc_name order by uptime nulls last) = 1
)
select 
  svc_name,
  uptime
from least_reliable_per_service 
qualify dense_rank() over(order by uptime) <=10;
