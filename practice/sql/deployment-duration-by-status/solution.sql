with cte as (select 
 lower(trim(svc_name)) as svc_name,
 lower(status) as status,
 dur_secs
 from deploy_logs)
 select
   svc_name,
   status,
   sum(dur_secs) as total_duration
 from cte
 group by svc_name, status;
