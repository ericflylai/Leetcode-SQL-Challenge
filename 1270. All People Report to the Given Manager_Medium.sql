#Write an SQL query to find employee_id of all employees that directly or indirectly report their work to the head of the company.

#The indirect relation between managers will not exceed three managers as the company is small.

#Method 1 union method to gather all levels ppl who direct/indirect to report manager
#select who report to 1 directly 
select employee_id
from Employees
where manager_id = '1' and employee_id <>'1'
union
#select who report to ppl who direct report to 1 
select employee_id
from Employees
where manager_id in (
select employee_id
from Employees
where manager_id = '1'and employee_id <>'1')
union 
#select the last level employees who repor to 1 indirectly
select employee_id
from Employees
where manager_id in (
select employee_id
from Employees
where manager_id in (
select employee_id
from Employees
where manager_id = '1'and employee_id <>'1'))

#Method 2 
#You create 3 tables and link them using manager_id = employee_id to find all links when table 3 manager id is 1. Also exclude table 1 employee id 1. 
SELECT e1.employee_id
FROM Employees e1,
     Employees e2,
     Employees e3
WHERE e1.manager_id = e2.employee_id
  AND e2.manager_id = e3.employee_id
  AND e3.manager_id = 1 
  AND e1.employee_id != 1
