#Write an SQL query to report the Capital gain/loss for each stock.

#The Capital gain/loss of a stock is the total gain or loss after buying and selling the stock one or many times.

#Return the result table in any order.



# seperate into 2 sheet buy & sell

with a as(
select stock_name, sum(price) as buy
from stocks
where operation='Buy'
group by stock_name),

b as(
select stock_name, sum(price) as sell
from stocks
where operation='Sell'
group by stock_name)


select a.stock_name, (sell-buy) as capital_gain_loss
from a
left join b
using (stock_name)


