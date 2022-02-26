#Write an SQL query to find the npv of each query of the Queries table.

#Return the result table in any order.

select a.id,a.year,ifnull(npv,0) as npv
from Queries a
left join NPV
using(id,year)
