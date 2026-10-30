select 
  product_id,
  to_char(transaction_date,'YYYY-MM') as month,
  sum(total_amount) as monthly_amount,
  sum(sum(total_amount)) over(partition by product_id
      rows between unbounded preceding and current row) as cumulative_total
from transactions
where product_id is not null
group by product_id, month
order by product_id, month;
