-- 05. Clients
SELECT *
from clients
ORDER BY birthdate DESC, id DESC;

-- 06. Birthdate
SELECT first_name, last_name, birthdate, review
FROM clients
WHERE card IS NULL and year(birthdate) BETWEEN '1978' and '1993'
ORDER BY last_name DESC, id ASC
LIMIT 5;

-- 07. Accounts
SELECT concat(last_name, first_name, length(first_name), 'Restaurant') as 'username',
reverse(substr(email, 2, 12))as 'password'
from waiters
WHERE salary is not null
ORDER BY `password` DESC;

-- 08. Top from menu
SELECT p.id, p.name, count(o.id) as 'count'
from products as p
JOIN orders_products as op on p.id = op.product_id
JOIN orders as o on op.order_id = o.id
GROUP BY p.id
HAVING count >= 5
ORDER BY count DESC, p.name asc;

-- 09. Availability
SELECT t.id, t.capacity, count(c.id) as 'count_clients', 
       case WHEN t.capacity - count(c.id) = 0 THEN 'Full'
			WHEN t.capacity - count(c.id) > 0 THEN 'Free seats'
            ELSE 'Extra seats'
            END as 'availability'
from `tables` as t
JOIN orders as o on t.id = o.table_id
JOIN orders_clients as oc on o.id = oc.order_id
JOIN clients as c on oc.client_id = c.id
WHERE t.floor = 1
GROUP BY t.id
ORDER BY t.id DESC;
