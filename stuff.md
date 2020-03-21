===== house =====
> currently household 

===== household =====
PK: id
FK: user_id
FK: house_id (uuid)

to find users that belong to the same household:
- in household, find house_id 
- hopefully list the columns with the user id? 
- SQL (example syntax) : 
Household.find_by_sql("
  SELECT * FROM clients
  INNER JOIN orders ON clients.id = orders.client_id
  ORDER BY clients.created_at desc
")
