#Write an SQL query to:

#Find the name of the user who has rated the greatest number of movies. In case of a tie, return the lexicographically smaller user name.
#Find the movie name with the highest average rating in February 2020. In case of a tie, return the lexicographically smaller movie name.

#using union all function

(select name as results
from MovieRating
left join Users
using(user_id)
group by user_id
order by count(movie_id) desc, name
limit 1 )

union all
#union either one is ok 

(select title as results
from MovieRating
left join Movies
using (movie_id)
where created_at between '2020-02-01' and '2020-2-28'
group by movie_id
order by avg(rating) desc, title
limit 1)
