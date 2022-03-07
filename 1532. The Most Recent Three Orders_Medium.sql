#Write an SQL query to find the most recent three orders of each user. If a user ordered less than three orders, return all of their orders.

#Return the result table ordered by customer_name in ascending order and in case of a tie by the customer_id in ascending order. If there is still a tie, order them by order_date in descending order.


select name as customer_name, a.customer_id,a.order_id, a.order_date
from (select customer_id, order_date,order_id, rank()over(partition by customer_id order by order_date desc) as rk
from Orders) as a
left join Customers
using(customer_id)
where rk <=3
order by customer_name,customer_id,order_date desc

#same logic
with a as(
select customer_id, order_date,order_id, rank()over(partition by customer_id order by order_date desc) as rk
from Orders)

select name as customer_name, a.customer_id,a.order_id, a.order_date
from a
left join Customers
using(customer_id)
where rk <=3
order by customer_name,customer_id,order_date desc

