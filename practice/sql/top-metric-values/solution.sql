select 
  distinct
  metric_value
from
  employee_metrics
qualify dense_rank() over(order by metric_value desc) <=5;
