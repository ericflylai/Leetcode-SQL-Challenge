#Write an SQL query to find the prices of all products on 2019-08-16. Assume the price of all products before any change is 10.

#Return the result table in any order.

# It has 2 situation. 
#1. change_date <=2019-08-16
# since we don't know if price is always up or down
# we need to rank change date and pick the one nearest 2019-08-16
with a as
(select product_id, new_price,change_date,rank() over(partition by product_id order by change_date desc) as rk
from Products 
where change_date <='2019-08-16'
)

select distinct product_id, new_price as price
from a
where rk = 1
union 

# 2. we can pick product from exclusive list
select distinct product_id, 10 as price
from Products
where product_id not in (select product_id from a)
