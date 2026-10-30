with category_tier_wise_details as
(select 
  category,
  user_id,
  count(*) as transaction_per_user,
  sum(total_amount) as sales_per_user,
  sum(total_amount) * 1.0 /count(*) as avg_sale_per_user,
  case when sum(total_amount) * 1.0 /count(*) > 500 then 'High'
  when sum(total_amount) * 1.0 /count(*) between 200 and 500 then 'Medium'
  else 'Low' end as tier
from transactions t
join products p
on t.product_id = p.product_id
group by category, user_id)
select
  category,
  tier as segment,
  count(*) as unique_users,
  sum(transaction_per_user) as total_transactions,
  sum(sales_per_user) as total_sales,
  avg(avg_sale_per_user) as avg_basket_size
from category_tier_wise_details
group by category, segment;
