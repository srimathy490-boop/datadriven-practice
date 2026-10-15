with total_revenue_per_product as
(select 
  category,
  product_name,
  sum(total_amount) as total_revenue
  , row_number() over(partition by category order by sum(total_amount) desc) as rnk
from transactions t
join products p
on t.product_id=p.product_id
where extract(year from transaction_date)='2026'
group by category, product_name)
select 
  category,
  product_name,
  total_revenue
from total_revenue_per_product
where rnk=1
order by total_revenue desc;
