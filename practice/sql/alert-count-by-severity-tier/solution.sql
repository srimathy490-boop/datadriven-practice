select 
nvl(ack_by,'unassigned') as responder,
count(*)
from alert_events
group by responder;
