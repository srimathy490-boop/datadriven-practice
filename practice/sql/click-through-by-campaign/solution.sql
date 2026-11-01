with clicked_or_not as (select 
  ad_campaign,
  count(*) as total_impressions,
  sum(case when clicked = 1 then 1 else 0 end) clicked,
  sum(case when clicked = 0 then 1 else 0 end) not_clicked
from
  ad_impressions
group by ad_campaign)
select
  ad_campaign,
  total_impressions,
  round((clicked * 1.0 / total_impressions) * 100,2) as clicked_pct,
  round((not_clicked* 1.0 / total_impressions) * 100,2) as not_clicked_pct
from 
  clicked_or_not;
