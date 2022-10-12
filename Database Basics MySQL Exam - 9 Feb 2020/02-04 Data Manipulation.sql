-- 02.Insert
INSERT INTO coaches (first_name, last_name, salary, coach_level)
SELECT p.first_name, p.last_name, p.salary * 2, length(p.first_name)
FROM players as p
WHERE p.age >= 45;

-- 03.Update
UPDATE coaches as c
left JOIN players_coaches as pc on c.id = pc.coach_id
set c.coach_level = c.coach_level + 1
WHERE c.first_name like 'A%' and pc.player_id is not null;

-- 04. Delete
DELETE FROM players
WHERE age >= 45;
