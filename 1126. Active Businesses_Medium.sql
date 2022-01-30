#The average activity for a particular event_type is the average occurences across all companies that have this event.

#An active business is a business that has more than one event_type such that their occurences is strictly greater than the average activity for that event.

#Write an SQL query to find all active businesses.

#Return the result table in any order.
with
a as (
# mark all rows meet requirement as 1
select distinct business_id,event_type,case
when t.occurences > t.avg_occurences then 1
else 0
end as mark
from (
# first calculate each event type avg occurences
select business_id,event_type,occurences,avg(occurences) over (partition by event_type) as avg_occurences
from events) as t
    )
#select sum of mark > 1 from a
select distinct business_id
from a
group by business_id
having sum(mark)>1
