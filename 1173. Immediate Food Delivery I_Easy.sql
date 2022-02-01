#If the customer's preferred delivery date is the same as the order date, then the order is called immediate; otherwise, it is called scheduled.

#Write an SQL query to find the percentage of immediate orders in the table, rounded to 2 decimal places.

#question related to calculate percentage, first thing comes up in my mind is use "case when" to mark rows

select round(sum(mark)/count(delivery_id)*100,2) as immediate_percentage
from(
select delivery_id,case
when order_date = customer_pref_delivery_date then 1
else 0
end as mark
from Delivery) as t
