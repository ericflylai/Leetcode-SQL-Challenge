#Write an SQL query to report the managers with at least five direct reports.

#Return the result table in any order.

#select manager id >=5

select distinct name
from Employee
where id in
(
select managerId
from Employee
group by managerId
having count(managerId)>=5
)
