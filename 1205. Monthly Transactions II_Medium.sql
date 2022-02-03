#Write an SQL query to find for each month and country: the number of approved transactions and their total amount, the number of chargebacks, and their total amount.

#Note: In your query, given the month and country, ignore rows with all zeros.

#seperate to calculate approved and chargebacks
with 
approve as (
#get all approved rows
select month,country, count(id) as approved_count, sum(amount) as approved_amount
from (
select id,country,state,amount, date_format(trans_date,'%Y-%m') as month
from Transactions
where state='approved') as t
group by month,country
    ),
#get all Chargebacks rows
chargeback as (
select month,country,count(trans_id) as chargeback_count, sum(amount) as chargeback_amount
from 
(select trans_id, date_format(a.trans_date,'%Y-%m') as month,country,amount
from Chargebacks a
left join Transactions b
on a.trans_id=b.id) as t1
group by month,country)

select distinct approve.month,approve.country, approved_count,approved_amount,ifnull(chargeback_count,0) as chargeback_count,ifnull(chargeback_amount,0) as chargeback_amount
from approve
left join chargeback
using(month,country)
union
select distinct chargeback.month,chargeback.country, ifnull(approved_count,0) as approved_count,ifnull(approved_amount,0) as approved_amount,chargeback_count,chargeback_amount
from chargeback
left join approve
using(month,country)




