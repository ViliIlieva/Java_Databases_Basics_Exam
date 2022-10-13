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

-- 08. The fastest player by towns
SELECT max(sd.speed) as 'max_speed', tw.name
from players as p 
RIGHT join skills_data as sd on p.skills_data_id = sd.id
RIGHT JOIN teams as t on p.team_id = t.id
RIGHT JOIN stadiums as s on t.stadium_id = s.id
RIGHT JOIN towns as tw on s.town_id = tw.id
WHERE t.name NOT LIKE 'Devify'
GROUP BY tw.id 
ORDER BY max_speed DESC, tw.name;

-- 09. Total salaries and players by country
SELECT  c.name, count(p.id) as 'total_count_of_players', sum(p.salary)
from players as p 
left JOIN teams as t on p.team_id = t.id
left JOIN stadiums as s on t.stadium_id = s.id
left JOIN towns as tw on s.town_id = tw.id
RIGHT JOIN countries as c on tw.country_id = c.id
GROUP BY c.id
ORDER BY total_count_of_players DESC, c.name;
