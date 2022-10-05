-- 05. Users
SELECT username, gender, age
FROM users
ORDER BY age DESC, username ASC;
---------------------------------------------------------------------------------------------------

-- 06. Extract 5 most commented photos
SELECT p.id, p.date as 'date_and_time', p.description,  count(p.id) as 'comentsCount'
FROM photos as p
JOIN comments as c on p.id = c.photo_id
GROUP BY p.id
ORDER BY comentsCount DESC, p.id asc
LIMIT 5;
---------------------------------------------------------------------------------------------------

-- 07. Lucky users
SELECT concat(u.id, ' ', u.username) as id_username, u.email
FROM users as u
JOIN users_photos as p ON u.id = p.user_id
WHERE p.photo_id = p.user_id
ORDER BY p.user_id ASC;
---------------------------------------------------------------------------------------------------

-- 08. Count likes and comments
SELECT p.id as 'photo_id', count(DISTINCT l.id) as 'likes_count', count(DISTINCT c.id) as 'coments_count'
FROM photos as p
LEFT JOIN likes as l on p.id = l.photo_id
LEFT JOIN comments as c on p.id = c.photo_id
GROUP BY p.id
ORDER BY likes_count DESC, coments_count DESC, photo_id ASC;
---------------------------------------------------------------------------------------------------

-- 09. The photo on the tenth day of the month
SELECT concat(left(`description`, 30), '...') as 'summary', `date`
from photos
WHERE day(`date`) = 10 
ORDER BY `date` DESC;



