select 
  ad_campaign,
  count(*) as total_impressions,
  round(cast(sum(case when clicked = 1 then 1 else 0 end) as real) * 100 / count(*),2) as 
    clicked_pct,
  round(cast(sum(case when clicked = 0 then 1 else 0 end) as real) * 100 / count(*),2) as 
    not_clicked_pct
from
  ad_impressions
group by ad_campaign;
