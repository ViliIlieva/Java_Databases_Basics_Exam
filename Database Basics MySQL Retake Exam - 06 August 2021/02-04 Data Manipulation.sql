-- 02.Insert
INSERT INTO games (`name`, rating, budget, team_id)
SELECT 
	lower(reverse(substr(`name`, 2))),
    t.id, t.leader_id * 1000, t.id
FROM teams as t
WHERE t.id BETWEEN 1 and 9;

-- 03.Update
UPDATE employees
set salary = salary + 1000
WHERE age < 40 and salary < 5000;

-- 04.Delete
DELETE g
FROM games as g
LEFT JOIN games_categories as gc on g.id = gc.game_id
WHERE g.release_date is NULL and gc.game_id IS NULL;
