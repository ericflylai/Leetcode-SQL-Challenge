#Write an SQL query to find all the people who viewed more than one article on the same date.

#Return the result table sorted by id in ascending order.

select viewer_id as id
from (
# need to use distinct since they may read some article more than once per day
select distinct viewer_id, count(distinct article_id) as total
from views
group by view_date) as t
where total >1
order by id
