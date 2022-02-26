#Write an SQL query to report the customer_id and customer_name of customers who have spent at least $100 in each month of June and July 2020.

#Return the result table in any order.

#method 1
# using orders table to calculate each customers June and July
with a as(
select customer_id,sum(price*quantity) as spend,case
when order_date like '2020-06%' then 'June'
when order_date like '2020-07%' then 'July'
end as order_month
from Orders
left join Product
using(product_id)
group by customer_id, order_month
having spend>=100 and order_month in('July','June'))

# each month at least 100, then need to count id after group if =2 
select customer_id, name from Customers c
right join a
using (customer_id)
group by customer_id
having count(customer_id)=2

#method 2
with
cet1 as (
select o.order_id,o.customer_id,o.product_id, price*quantity as total,
case when order_date between '2020-06-01'and'2020-06-30' then 'June'
     when order_date between '2020-07-01'and'2020-07-31' then 'July'
     else 'others'
end as month
   from orders o 
left join product p
on o.product_id= p.product_id
)

# more straight forward thougt
select distinct cet1.customer_id,c.name
from cet1
left join Customers c
on cet1.customer_id=c.customer_id
group by cet1.customer_id
having sum(if(month = 'June',total,0))>=100
and sum(if(month = 'July',total,0))>=100

