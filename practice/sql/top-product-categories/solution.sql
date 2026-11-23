with product_above_3_rating as (
  select 
  p.category,
  p.rating,
  transaction_id
  from transactions t
  inner join products p 
  on t.product_id=p.product_id
  where p.rating >= 3.0
)
  select
    category,
    count(*) as txn_count,
    dense_rank() over(order by count(*) desc) as rnk
  from product_above_3_rating
  group by category
  qualify rnk <= 3
;
