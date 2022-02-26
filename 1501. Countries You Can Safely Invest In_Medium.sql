#A telecommunications company wants to invest in new countries. The company intends to invest in the countries where the average call duration of the calls in this country is strictly greater than the global average call duration.

#Write an SQL query to find the countries where this company can invest.

#Return the result table in any order.

#select avg(duration) as avg_global from calls
#get all callers' and callees' countries

# key thoughts: need to replace id with country
with a as 
(
select t1.country as caller_country,t2.country as callee_country,duration from Calls
left join 
(select id, b.name as country
from Person a
left join Country b
on left(phone_number,3)=country_code) t1
on caller_id= t1.id
left join 
(select id, b.name as country
from Person a
left join Country b
on left(phone_number,3)=country_code) t2
on callee_id= t2.id
)

select distinct t1.country
# key thoughts: window function can calculate avg total leave over blank
from(select t.country,avg(duration)over(partition by country) as duration1, avg(duration)over() as global_duration from
(
select caller_country as country, duration
from a
# key thoughts: union all will keep duplicate rows imp
union all
select callee_country as country, duration
from a
) as t) as t1
where duration1>global_duration





