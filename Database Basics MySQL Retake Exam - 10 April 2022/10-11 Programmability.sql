-- 10. History movies
delimiter ***
CREATE FUNCTION udf_actor_history_movies_count(`full_name` VARCHAR(50)) 
RETURNS INT
DETERMINISTIC
	BEGIN
    DECLARE history_movies INT;
    set history_movies := 
    (SELECT count(gm.movie_id)
    FROM actors as a
join movies_actors as ma on a.id = ma.actor_id
JOIN genres_movies as gm on gm.movie_id = ma.movie_id
JOIN genres as g on g.id = gm.genre_id
    WHERE concat(a.first_name, ' ', a.last_name) = full_name and
    g.name = 'History');
		RETURN history_movies;
    END
***
SELECT udf_actor_history_movies_count('Stephan Lundberg')  AS 'history_movies';
