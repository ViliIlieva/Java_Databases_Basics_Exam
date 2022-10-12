-- 05. Players
SELECT first_name, age, salary
from players
ORDER BY salary DESC;

-- 06. Young offense players without contract
SELECT p.id, concat(p.first_name, ' ', p.last_name) as 'full_name', age, position, hire_date
FROM players as p
JOIN skills_data as s on p.skills_data_id = s.id
WHERE p.age < 23 and p.position = 'A' and hire_date is null and s.strength > 50
ORDER BY salary ASC, age;

-- 07. Detail info for all teams
SELECT t.name, t.established, t.fan_base, count(p.id) as 'players_count'
FROM players as p 
RIGHT JOIN teams as t on p.team_id = t.id
GROUP BY t.id
ORDER BY players_count DESC, t.fan_base DESC;
