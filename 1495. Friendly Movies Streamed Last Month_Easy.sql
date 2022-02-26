#Write an SQL query to report the distinct titles of the kid-friendly movies streamed in June 2020.

#Return the result table in any order.

#select all in june 2020
with a as(
select * from TVProgram
where program_date like "2020-06%"),
# kids yes and movies yes
b as(
select * from Content
where Kids_content = 'Y' and content_type ='Movies')

#need to consider duplicate and null 
select distinct title from a
left join b
using(content_id)
where title is not null
