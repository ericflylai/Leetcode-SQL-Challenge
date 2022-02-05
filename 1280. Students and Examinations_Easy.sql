#Write an SQL query to find the number of times each student attended each exam.

#Return the result table ordered by student_id and subject_name.

# should be consider if attended exam is 0, need to list them as well
with
a as (
#create a table as output
select * from Students
cross join Subjects),
b as (
#summary examinations
select *, count(subject_name) as attended_exams
from Examinations
group by student_id, subject_name)

select a.student_id, student_name, a.subject_name, ifnull(attended_exams,0) as attended_exams
from a
left join b
using(student_id,subject_name)
order by a.student_id,a.subject_name

