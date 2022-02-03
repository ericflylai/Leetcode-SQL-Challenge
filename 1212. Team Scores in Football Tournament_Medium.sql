#You would like to compute the scores of all teams after all matches. Points are awarded as follows:
#A team receives three points if they win a match (i.e., Scored more goals than the opponent team).
#A team receives one point if they draw a match (i.e., Scored the same number of goals as the opponent team).
#A team receives no points if they lose a match (i.e., Scored fewer goals than the opponent team).
#Write an SQL query that selects the team_id, team_name and num_points of each team in the tournament after all described matches.

#Return the result table ordered by num_points in decreasing order. In case of a tie, order the records by team_id in increasing order.
# according to goals to add points first
#calculate all host team points
with a as(
select distinct host_team, sum(host_points) as num_points1
from(
select match_id,host_team,guest_team,case
when host_goals>guest_goals then 3
when host_goals<guest_goals then 0
else 1 end as host_points, case
when host_goals>guest_goals then 0
when host_goals<guest_goals then 3
else 1 end as guest_points
from Matches) as t
group by host_team),
#calculate all guest team points
b as (
select distinct guest_team, sum(guest_points) as num_points2
from(
select match_id,host_team,guest_team,case
when host_goals>guest_goals then 3
when host_goals<guest_goals then 0
else 1 end as host_points, case
when host_goals>guest_goals then 0
when host_goals<guest_goals then 3
else 1 end as guest_points
from Matches) as t
group by guest_team)

select c.team_id,c.team_name,ifnull(num_points,0) as num_points
from Teams c
left join(
#pay attention! need to consider ifnull as 0,otherwise cannot calculate
select distinct host_team as team_id,(ifnull(a.num_points1,0)+ifnull(b.num_points2,0)) as num_points
from a 
left join b
on host_team=guest_team
union
select distinct guest_team as team_id,(ifnull(a.num_points1,0)+ifnull(b.num_points2,0)) as num_points
from b 
left join a
on host_team=guest_team
) as total
using(team_id)
order by num_points desc,team_id









