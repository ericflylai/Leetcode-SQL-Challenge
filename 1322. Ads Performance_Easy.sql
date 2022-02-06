#A company is running Ads and wants to calculate the performance of each Ad.

#Write an SQL query to find the ctr of each Ad. Round ctr to two decimal points.

#Return the result table ordered by ctr in descending order and by ad_id in ascending order in case of a tie.

with
#get the ad_id list
a as (
select distinct ad_id from Ads),
#calculated ctr if they don't only ignored only
b as(
select ad_id, round(ifnull(sum(total1)/count(total1)*100,0),2) as ctr
from(
select ad_id, case
when action ='Clicked' then '1'
else '0' end as total1
from Ads
where action <>'Ignored')as t
group by ad_id)
#pls note cannot use 0.00 need to use round(,2)only
select a.ad_id, round(ifnull(ctr,0),2) as ctr
from a left join b
using(ad_id)
order by ctr desc, a.ad_id
