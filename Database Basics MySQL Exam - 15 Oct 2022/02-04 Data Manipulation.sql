-- 02.Insert
INSERT INTO products (`name`, `type`, price)
SELECT concat(w.last_name, ' specialty'),
	'Cocktail', ceil(w.salary*0.01)
from waiters as w
WHERE w.id > 6;

-- 03 Update
Update orders
set table_id = table_id -1
where id between 12 and 23;

-- 04 Delete
DELETE w
FROM waiters as w
LEFT JOIN orders as o on w.id = o.waiter_id
WHERE o.waiter_id is NULL;
