#Write an SQL query to find the average selling price for each product. average_price should be rounded to 2 decimal places.

with c as (
# attention!!cannot add distinct since if price is same on different time period,there will be only one record. 
select a.product_id,ifnull(units,0) as units, ifnull(price*units,0) as totalprice
from Prices a
left join UnitsSold b
on a.product_id=b.product_id and purchase_date between start_date and end_date)

select distinct product_id, round(sum(totalprice)/sum(units),2) as average_price
from c
group by product_id
