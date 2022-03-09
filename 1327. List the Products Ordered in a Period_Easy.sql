#Write an SQL query to get the names of products that have at least 100 units ordered in February 2020 and their amount.

#Return result table in any order.

select product_name,t.total as unit
from
(
select product_id, sum(unit) as total
from orders
where order_date like '2020-02-%'
group by product_id
having total >= 100
) as t
left join Products
using(product_id)
