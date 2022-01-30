#Write an SQL query to report the fraction of players that logged in again on the day after the day they first logged in, rounded to 2 decimal places. In other words, you need to count the number of players that logged in for at least two consecutive days starting from their first login date, then divide that number by the total number of players.

#get there first log note first then compare to make count 
with 
a as (
select *, min(event_date)over(partition by player_id order by event_date) as firstlog
from Activity)

select round(sum(case 
           when event_date-firstlog =1 then 1
           else 0 end)/count(distinct player_id),2) as fraction
from a
