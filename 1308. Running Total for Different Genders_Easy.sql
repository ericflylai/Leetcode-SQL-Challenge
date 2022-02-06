#Write an SQL query to find the total score for each gender on each day.

#Return the result table ordered by gender and day in ascending order.

#please check the sample first, it doesn't only show subtotal for each group. Thus, partition by is the best function to use here. 
#Method 1
select gender, day, sum(total)over(partition by gender order by day)as total
from(
select gender, day, sum(score_points) as total
from Scores
group by gender,day
order by gender, day) as t
order by gender, day

#Method 2 easier way
select gender, day, sum(score_points) over (partition by gender order by gender,day ) as total
from Scores
