#Write an SQL query to find the start and end number of continuous ranges in the table Logs.

#Return the result table ordered by start_id.

#Method1 Get row#, then use dif(log-row#) group the subdataset, Rank limit1 to pick up start_id,then count each subdataset to calculate end_id
with cte as(
select distinct log_id,rank()over(partition by dif order by log_id) as rk,count(dif)over(partition by dif) as countnumber
from(select rownumber, log_id, (log_id-rownumber) as dif
from (select row_number()over(order by log_id) as rownumber,log_id
from Logs) as a) as t)

select start_id, (start_id+countnumber-1) as end_id
from (
select distinct log_id as start_id, countnumber
from cte
where rk = 1) as c
order by start_id


#Method 2 better way: similar logic with Method1, but can direct pick min and max logid in each group.
select min(log_id) as start_id,max(log_id) as end_id
from(
select log_id,(log_id-row_number()over(order by log_id))as gap
from Logs) as t
group by gap
order by start_id
