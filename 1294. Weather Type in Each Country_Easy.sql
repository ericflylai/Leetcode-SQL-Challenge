#Write an SQL query to find the type of weather in each country for November 2019.

#The type of weather is:

#Cold if the average weather_state is less than or equal 15,
#Hot if the average weather_state is greater than or equal to 25, and
#Warm otherwise.
#Return result table in any order.

#notes please read the question carefully, need to calculate the average temp


select distinct country_name, case
when avg(weather_state) <= 15 then 'Cold'
when avg(weather_state) >= 25 then 'Hot'
else 'Warm'
end as weather_type
from Weather
left join Countries
using(country_id)
where day between '2019-11-01' and '2019-11-30'
group by country_name
