-- 05. Employees
SELECT `first_name`, `last_name`, age, salary,happiness_level
FROM employees
ORDER BY salary, id;

-- 06. Addresses of the teams
SELECT t.name as 'team_name', a.name as 'address_name', length(a.name) as 'count_of_characters'
FROM teams as t
JOIN offices as o ON t.office_id = o.id
JOIN addresses as a ON o.address_id = a.id
WHERE o.website is NOT NULL
ORDER BY team_name, address_name;

-- 07. Categories Info
SELECT c.name, count(g.id) as 'games_count', 
round( avg(g.budget), 2) as 'avg_budget', max(g.rating) as 'max_rating'
FROM games as g
JOIN games_categories as gc on g.id = gc.game_id
JOIN categories as c on gc.category_id = c.id
GROUP BY c.id
HAVING max_rating > 9.4
ORDER BY games_count DESC, c.name;

-- 08. Games of 2022
SELECT 	g.name, g.release_date, concat(left(g.description, 10), '...') as 'summary',
	CASE WHEN month(g.release_date) BETWEEN 1 AND 3 THEN 'Q1'
		 WHEN month(g.release_date) BETWEEN 4 AND 6 THEN 'Q2'
         WHEN month(g.release_date) BETWEEN 7 AND 9 THEN 'Q3'
         ELSE 'Q4'
		 end as 'quarter',
	t.name as 'team_name'
FROM games as g
JOIN teams as t on g.team_id = t.id
WHERE year(g.release_date) > 2021 and month(g.release_date) % 2 = 0 and g.name LIKE '%2'
ORDER BY quarter;

-- 09. Full info for games
SELECT g.name, 
	   case WHEN g.budget < '50000' THEN 'Normal budget'
		    ELSE 'Insufficient budget'
            END as 'budget_level',
	   t.name as 'team_name',
       a.name as 'address_name'
from games as g
LEFT JOIN games_categories as gc on g.id = gc.game_id
JOIN teams as t on g.team_id = t.id
JOIN offices as o on t.office_id = o.id
JOIN addresses as a on o.address_id = a.id
WHERE g.release_date is NULL and gc.game_id IS NULL
ORDER BY g.name;
