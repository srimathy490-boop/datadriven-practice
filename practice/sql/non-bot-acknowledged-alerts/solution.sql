select 
  *
from alert_events
where lower(ack_by) not like 'alice' or ack_by is null
order by fired_at asc;
