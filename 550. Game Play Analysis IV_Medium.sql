#Write an SQL query to report the fraction of players that logged in again on the day after the day they first logged in, rounded to 2 decimal places. In other words, you need to count the number of players that logged in for at least two consecutive days starting from their first login date, then divide that number by the total number of players.

#Method1 get there first log note first then compare to make count 
with 
a as (
select *, min(event_date)over(partition by player_id order by event_date) as firstlog
from Activity)

select round(sum(case 
           when event_date-firstlog =1 then 1
           else 0 end)/count(distinct player_id),2) as fraction
from a


#Method2 get each player's first log as table, then jion with activity and calculate directly. This method is easier to understand
with a as(
select player_id as id, min(event_date)over(partition by player_id) as mindate
from activity)


select round(count(distinct id)/count(distinct player_id),2) as fraction
from activity b
left join a
on b.player_id=a.id and event_date-mindate=1
