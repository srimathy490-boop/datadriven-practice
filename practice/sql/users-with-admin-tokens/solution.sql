select 
  user_id,
  username,
  email,
  tkn.token_id,
  tkn.scope
from users u
inner join api_tokens tkn
on u.user_id=tkn.owner_id
where scope = 'admin'
order by user_id, issued;
