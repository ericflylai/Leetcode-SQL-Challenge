#Write an SQL query to recommend pages to the user with user_id = 1 using the pages that your friends liked. It should not recommend pages you already liked.

select distinct page_id as recommended_page
from Likes
# select all user 1 friends' likes page 
where user_id in
(select distinct user2_id from Friendship
where user1_id = '1'
union
select distinct user1_id from Friendship
where user2_id = '1')
and 
#exclude user 1 likes page 
page_id not in
(select page_id from Likes
where user_id = '1')
