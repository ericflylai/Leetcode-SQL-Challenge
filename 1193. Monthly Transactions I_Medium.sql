#Write an SQL query to find for each month and country, the number of transactions and their total amount, the number of approved transactions and their total amount.

#Return the result table in any order.

with a as
# get all info related to total
(select distinct country, sum(amount) as trans_total_amount, date_format(trans_date,'%Y-%m') as month, count(id) as trans_count
from Transactions
group by month,country),

#get all info related to approved
b as 
(select distinct country,sum(amount) as approved_total_amount, date_format(trans_date,'%Y-%m') as month,count(id) as approved_count
from Transactions
where state = 'approved'
group by month,country)

#using ifnull to replace NA as O
select a.month,a.country,ifnull(a.trans_count,0) as trans_count,ifnull(b.approved_count,0) as approved_count,ifnull(a.trans_total_amount,0) as trans_total_amount,ifnull(b.approved_total_amount,0) as approved_total_amount
from a
left join b
on a.month=b.month and a.country=b.country

