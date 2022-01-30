#Write an SQL query to find the average daily percentage of posts that got removed after being reported as spam, rounded to 2 decimal places.


#Thought: select all report & spam records, mark as 1
# then join removals table to mark post_id which has been removed
# it mentioned post_id is PK in second table, so no need to worry about some post_id and different remove_date situation. 
# Last, calculate the result.
with 
a as (
select post_id,action_date,mark,case
when remove_date is not null then 1
else 0
end as remove_mark
from
# read question carefully, in Actions table, it mentioned there is no primary key for this table, it may have duplicate rows. Thus,we need to select distinct one and exclude duplicated rows.Otherwise, it won't be passed by all tests
(select distinct post_id,action_date,case
when action = 'report' and extra ='spam' then 1
else 0
end as mark
from Actions) as a
left join Removals
using (post_id)
where mark > 0
)

select round(avg(remove_mark1/mark1*100),2) as average_daily_percent
from(
select distinct action_date,sum(remove_mark) as remove_mark1,sum(mark) as mark1
from a
group by action_date) as b
