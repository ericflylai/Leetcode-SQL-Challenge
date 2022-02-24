#Write an SQL query to report the respective department name and number of students majoring in each department for all departments in the Department table (even ones with no current students).

#Return the result table ordered by student_number in descending order. In case of a tie, order them by dept_name alphabetically.

select dept_name, ifnull(student_number,0) as student_number
from Department 
left join 
(select dept_id, count(student_id) as student_number
from Student
group by dept_id) as t
using (dept_id)
order by student_number desc, dept_name
