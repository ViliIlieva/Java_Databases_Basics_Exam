-- 10. Get user’s photos count
delimiter ***
CREATE FUNCTION udf_users_photos_count(username VARCHAR(30)) 
RETURNS INT
DETERMINISTIC
	BEGIN
    DECLARE photosCount INT;
    set photosCount := 
    (SELECT count(up.photo_id)  FROM users_photos as up
    JOIN users as u ON u.id = up.user_id
    WHERE u.username = username);
	RETURN photosCount;
  END
***  
SELECT udf_users_photos_count('ssantryd') AS photosCount;
-----------------------------------------------------------------------------------------

-- 11. Increase user age
delimiter ***
CREATE PROCEDURE udp_modify_user(address VARCHAR(30), town VARCHAR(30)) 
BEGIN
	UPDATE users as u
    JOIN addresses as a on u.id = a.user_id
		SET u.age = age +10
        WHERE a.address = address AND a.town = town;
END
***

CALL udp_modify_user ('97 Valley Edge Parkway', 'Divinópolis');
SELECT u.username, u.email,u.gender,u.age,u.job_title FROM users AS u
WHERE u.username = 'eblagden21';
