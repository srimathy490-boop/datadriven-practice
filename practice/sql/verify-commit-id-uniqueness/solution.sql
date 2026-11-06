select 
  count(*) as total_commits,
  count(distinct trim(lower(author))) as distinct_authors from
  repo_commits;
