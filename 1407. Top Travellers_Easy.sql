#Write an SQL query to report the distance traveled by each user.

#Return the result table ordered by travelled_distance in descending order, if two or more users traveled the same distance, order them by their name in ascending order.


with a as(
select user_id, sum(distance) as travelled_distance
from Rides
group by user_id)

#check the sample before write the sql since it needs to display name with 0 distince.
select name,ifnull(travelled_distance,0) as travelled_distance
from a
right join Users
on user_id=id
order by travelled_distance desc,name
