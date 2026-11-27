-- select 
--   tbl_name,
--   sum(case when passed = 0 then 1 else 0 end) as failing_checks,
--   sum(case when passed = 0 and lower(severity) in ('critical','high') then 1 else 0 end) 
--   as high_severity_failures
-- from dq_checks
-- group by tbl_name
-- order by failing_checks desc;


select
  tbl_name,
  count(passed) as failing_checks,
  sum(case when lower(severity) in ('critical','high') then 1 else 0 end) 
    as high_severity_failures
from 
  dq_checks
where passed = 0
group by tbl_name
order by failing_checks desc;
