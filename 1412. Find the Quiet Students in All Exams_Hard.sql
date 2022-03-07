#A quiet student is the one who took at least one exam and did not score the high or the low score.

#Write an SQL query to report the students (student_id, student_name) being quiet in all exams. Do not return the student who has never taken any exam.

#return the result table ordered by student_id.

with a as(
select student_id, score,max(score)over(partition by exam_id) as max_score, min(score)over(partition by exam_id )as min_score
from Exam
)

#using exam serveral times to identify quiet student.Think about how to select qulified student. 
select distinct t.student_id,student_name
from (select distinct  student_id
from a) as t 
left join Student
using (student_id)
where student_id not in (
select distinct student_id
from a 
where score in (min_score,max_score))
order by student_id
 



