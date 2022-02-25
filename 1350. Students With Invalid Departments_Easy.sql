#Write an SQL query to find the id and the name of all students who are enrolled in departments that no longer exist.

select distinct a.id,a.name
from Students a
left join Departments b
on a.department_id=b.id
where b.id is null
