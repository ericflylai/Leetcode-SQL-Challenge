#Write an SQL query to report the names of all the salespersons who did not have any orders related to the company with the name "RED".

#Return the result table in any order.

#Method 1
select name from SalesPerson
where sales_id not in(select sales_id from orders 
left join Company
using (com_id)
where name ='RED')

#Method 2
# select all sales with red
# then select exclusive 

With
cet1 as (select sales_id from orders o
left join company c 
on o.com_id=c.com_id
where c.name = "RED")


select s.name from SalesPerson s
left join cet1
on s.sales_id=cet1.sales_id
where cet1.sales_id is null
