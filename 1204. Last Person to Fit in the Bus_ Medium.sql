#There is a queue of people waiting to board a bus. However, the bus has a weight limit of 1000 kilograms, so there may be some people who cannot board.

#Write an SQL query to find the person_name of the last person that can fit on the bus without exceeding the weight limit. The test cases are generated such that the first person does not exceed the weight limit.

#1.method using sum over then rank over
with
a as 
(select person_id,person_name,sum(weight)over(order by turn) as totalweight
from Queue)

select person_name
from
(select person_id,person_name,totalweight,rank()over(order by totalweight desc) as rk
from a
where totalweight <=1000) as t
where rk = 1

#2.easier method using sum over to order directly.
select t.person_name from 
(select person_name,turn,sum(weight) over(order by turn ) as weight1
from Queue) as t
where t.weight1 <=1000
order by turn desc
limit 1
