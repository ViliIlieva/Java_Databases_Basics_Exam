-- 02. Insert
INSERT INTO addresses (address , town, country, user_id)
SELECT u.username, u.password, u.ip, u.age
FROM users as u
WHERE u.gender = 'M';
---------------------------------------------------------------------------------------------------

-- 03. Update
UPDATE addresses AS a 
SET 
    country = (CASE
        WHEN a.country LIKE 'B%' THEN 'Blocked'
        WHEN a.country LIKE 'T%' THEN 'Test'
        WHEN a.country LIKE 'P%' THEN 'In Progress'
        ELSE a.country
    END);
---------------------------------------------------------------------------------------------------
    
  
-- 04. Delete
DELETE FROM addresses as a
WHERE a.id % 3 = 0;
