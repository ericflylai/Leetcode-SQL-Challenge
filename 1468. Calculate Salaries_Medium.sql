#Write an SQL query to find the salaries of the employees after applying taxes. Round the salary to the nearest integer.

#The tax rate is calculated for each company based on the following criteria:

#0% If the max salary of any employee in the company is less than $1000.
#24% If the max salary of any employee in the company is in the range [1000, 10000] inclusive.
#49% If the max salary of any employee in the company is greater than $10000.

#thoughts: get max salary for each company then case when to calculate
with a as (
select *,max(salary)over(partition by company_id) as max_salary
from Salaries
)
select company_id, employee_id,employee_name, case
when max_salary < 1000 then salary
when max_salary >10000 then round(salary*(1-0.49),0)
else round(salary*(1-0.24),0)
end as salary
from a

# Somehow, below code cannot passed all samples, but still don't know why, if anyone can explain it, really appreciated
#with a as (
#select *,case
#when max(salary)over(partition by company_id) <1000 then '0'
#when max(salary)over(partition by company_id) >10000 then '0.49'
#else '0.24'
#end as taxes
#from Salaries
#)
#select company_id, employee_id,employee_name, round(salary*(1-taxes) ,0)as salary
#from a
