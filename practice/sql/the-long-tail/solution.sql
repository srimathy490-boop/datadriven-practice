--group by method, sort by latency and get the first five
--outer query calculate the average and round it to two decimals

with cte as(
  select 
  upper(method) as method,
  latency,
  row_number() over(partition by upper(method) order by latency nulls last) as rnk
  from api_calls)
select method, round(avg(latency),2) as fastest_five_avg
from cte
where rnk <=5
group by method;
