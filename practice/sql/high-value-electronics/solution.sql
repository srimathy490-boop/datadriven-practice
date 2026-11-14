select
  product_name,
  price
from
  products
where lower(category) = 'electronics' and in_stock = 1
order by price desc 
limit 5;
