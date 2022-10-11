-- 02. Insert
INSERT INTO clients (full_name, phone_number)
SELECT
	concat(d.first_name, ' ', d.last_name),
    concat('(088) 9999', d.id*2)
FROM drivers as d
WHERE d.id > 9 and d.id < 21;

-- 03. Update
UPDATE cars
set `condition` = 'C'
WHERE (mileage >= 800000 OR mileage IS NULL) and year <= 2010 AND make NOT like 'Mercedes-Benz';

-- 04. Delete
DELETE c
FROM clients as c
LEFT JOIN courses as k on c.id = k.client_id
WHERE k.client_id IS NULL AND length(c.full_name) > 3;
