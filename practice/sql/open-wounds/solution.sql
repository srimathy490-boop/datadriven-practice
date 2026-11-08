select 
  svc_name,
  alert_id,
  severity,
  status,
  fired_at
from alert_events
where resolved is null
qualify row_number() over(partition by svc_name order by fired_at asc) = 1
order by svc_name;
