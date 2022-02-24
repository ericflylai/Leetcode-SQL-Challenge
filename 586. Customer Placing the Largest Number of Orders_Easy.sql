#Write an SQL query to find the customer_number for the customer who has placed the largest number of orders.

#The test cases are generated so that exactly one customer will have placed more orders than any other customer.

#Since it is only one picked, limit function comes in my mind.

select customer_number
from orders
group by customer_number 
order by count(order_number) desc
limit 1
