-- 05. Countries
SELECT * 
FROM countries 
ORDER BY currency DESC, id;

-- 06. Old movies
SELECT a.id, m.title , a.runtime, a.budget, a.release_date
FROM movies as m
JOIN movies_additional_info as a ON m.movie_info_id = a.id
WHERE year(a.release_date) BETWEEN '1996' AND '1999'
ORDER BY a.runtime ASC, a.id
LIMIT 20;

-- 07. Movie casting
SELECT  concat(a.first_name, ' ', a.last_name) as 'full_name', 
		concat(reverse(a.last_name), length(last_name), '@cast.com') as 'email',
		2022 - year(a.birthdate) as 'age', a.height
FROM actors as a
LEFT JOIN movies_actors as m ON a.id = m.actor_id
WHERE m.actor_id IS NULL
ORDER BY a.height ASC;

-- 08. International festival
SELECT c.name, count(m.id) as 'movies_count'
FROM countries as c
JOIN movies as m ON c.id = m.country_id
GROUP BY m.country_id
HAVING movies_count >= 7
ORDER BY c.name DESC;

-- 09. Rating system
SELECT  m.title, 
		case
        WHEN i.rating <= 4 THEN 'poor'
        WHEN i.rating <= 7 THEN 'good'
        ELSE 'excellent'
        END as 'rating',
        CASE
        WHEN i.has_subtitles = 1 THEN 'english'
        ELSE '-'
        END as 'subtitles',
        i.budget
from movies as m
JOIN movies_additional_info as i ON m.movie_info_id = i.id
ORDER BY i.budget DESC;
