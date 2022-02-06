#Write an SQL query to find the team size of each of the employees.

#Return result table in any order.

#good example to use partition by 

select distinct employee_id, count(employee_id)over(partition by team_id) as team_size
from employee

