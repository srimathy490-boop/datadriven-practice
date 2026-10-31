with ranked_author as (
  SELECT
    REPO_NAME,
    AUTHOR AS MOST_TENURED_AUTHOR,
    ROW_NUMBER() OVER(PARTITION BY REPO_NAME ORDER BY opened_at) as rnk
  FROM
    CODE_REVIEWS 
 )
 select 
   o.review_id,
   o.repo_name,
   o.author,
   c.most_tenured_author
 from code_reviews o
 inner join ranked_author c
 on o.repo_name = c.repo_name
 where c.rnk = 1
 order by o.repo_name, o.author, o.review_id;
