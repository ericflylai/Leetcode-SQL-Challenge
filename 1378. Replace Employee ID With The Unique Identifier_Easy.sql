#Write an SQL query to show the unique ID of each user, If a user does not have a unique ID replace just show null.

#Return the result table in any order.

select unique_id, name
from EmployeeUNI
right join Employees
using(id)
