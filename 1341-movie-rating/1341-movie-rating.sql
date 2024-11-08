# Write your MySQL query statement below
(select Users.name as results
from MovieRating left join Users
on MovieRating.user_id = Users.user_id
group by MovieRating.user_id
order by count(*) desc, Users.name
limit 1)

union all

(select Movies.title as results
from MovieRating left join Movies
on MovieRating.movie_id = Movies.movie_id
WHERE EXTRACT(YEAR_MONTH FROM MovieRating.created_at) = 202002
GROUP BY Movies.title
order by AVG(MovieRating.rating) desc, Movies.title
limit 1)