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
