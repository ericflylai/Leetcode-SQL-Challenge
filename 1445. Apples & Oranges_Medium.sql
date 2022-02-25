#Write an SQL query to report the difference between the number of apples and oranges sold each day.

#Return the result table ordered by sale_date.

#create 2 seperate sheet with each fruit

with apples as (
select * from Sales
where fruit = 'apples'),
oranges as (
select * from Sales
where fruit = 'oranges')


select apples.sale_date, (apples.sold_num-oranges.sold_num) as diff
from apples
left join oranges
using(sale_date)
order by apples.sale_date
