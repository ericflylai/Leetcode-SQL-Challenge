#You are the restaurant owner and you want to analyze a possible expansion (there will be at least one customer every day).

#Write an SQL query to compute the moving average of how much the customer paid in a seven days window (i.e., current day + 6 days before). average_amount should be rounded to two decimal places.

#Return result table ordered by visited_on in ascending order.

with
#get the list as output
a as (
select distinct visited_on from customer
where date_sub(visited_on,interval 6 day) in (select visited_on from customer))

select a.visited_on, sum(amount) as amount, round(sum(amount)/7,2) as average_amount
from a
cross join customer b
#cannot use below
#where a.visited_on-b.visited_on >=0 and a.visited_on-b.visited_on #<=6
where b.visited_on between date_sub(a.visited_on, interval 6 day) and a.visited_on
group by a.visited_on
order by a.visited_on



