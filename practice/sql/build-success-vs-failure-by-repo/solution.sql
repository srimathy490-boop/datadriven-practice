select 
  repo_name,
  count(case when status='success' then 1 end) as success_count,
  count(case when status='failure' then 1 end) as failure_count,
  avg(dur_secs) as avg_duration
from ci_builds
group by repo_name;
