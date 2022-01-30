#Write an SQL query to report the device that is first logged in for each player.

#Return the result table in any order.

with 
a1 as (
select distinct player_id, min(event_date) as firstlog
from Activity
group by player_id)

select a1.player_id,b1.device_id
from a1 
left join Activity b1
on a1.player_id=b1.player_id and a1.firstlog=b1.event_date
