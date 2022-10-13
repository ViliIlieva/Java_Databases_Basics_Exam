-- 10. Find all players that play on stadium
delimiter ***
CREATE FUNCTION udf_stadium_players_count (stadium_name VARCHAR(30))   
RETURNS INT
DETERMINISTIC
	BEGIN
    DECLARE count INT;
    set count := 
    (SELECT count(p.id)   FROM players as p
    JOIN teams as t ON p.team_id = t.id
    JOIN stadiums as s on t.stadium_id = s.id
    WHERE s.name = stadium_name);
		RETURN count;
    END
***
SELECT udf_stadium_players_count ('Jaxworks') as `count`;
------------------------------------------------------------------------------------------

-- 11. Find good playmaker by teams
delimiter ***
CREATE PROCEDURE udp_find_playmaker (min_dribble_points INT, team_name VARCHAR(45)) 
BEGIN
	SELECT concat(p.first_name, ' ', p.last_name) as 'full_name',
		p.age, p.salary, sd.dribbling, sd.speed, t.name
    FROM players as p
    JOIN skills_data as sd ON p.skills_data_id = sd.id
    JOIN teams as t on p.team_id = t.id
    WHERE t.name = team_name and sd.dribbling > min_dribble_points
    ORDER BY sd.speed DESC
    LIMIT 1;
END
***
CALL udp_find_playmaker (20, ‘Skyble’);
