#Write an SQL query to report all the consecutive available seats in the cinema.

#Return the result table ordered by seat_id in ascending order.

#The test cases are generated so that more than two seats are consecutively available.

#Method 1 self join twice to find more than 2 seats are consecutively available and use abs function to select all seats. 
select distinct t.id as seat_id

from (select a.seat_id as id,b.seat_id, a.free as afree,b.free as bfree from Cinema a
cross join Cinema b
on abs(b.seat_id-a.seat_id)=1
having afree=1 and bfree=1
) as t
cross join Cinema c
on abs(c.seat_id-t.seat_id)=1
where c.free=1
order by seat_id

#OR

with 
cet1 as (
select a.seat_id as id1, a.free as free1, b.seat_id as id2, b.free as free2 from 
Cinema a 
cross join Cinema b
on abs(a.seat_id-b.seat_id)=1
)

select distinct cet1.id1 as seat_id
from cet1
where cet1.free1=cet1.free2 and cet1.free1=1
order by cet1.id1

#Method 2 using union to select 2 twice for different cols.
select distinct a.seat_id
from Cinema a
cross join Cinema b
on a.seat_id= b.seat_id+1
where a.free=1 and b.free=1
union
select distinct b.seat_id
from Cinema a
cross join Cinema b
on a.seat_id= b.seat_id+1
where a.free=1 and b.free=1
order by seat_id
