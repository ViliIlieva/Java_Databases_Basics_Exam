-- 02. Insert
INSERT INTO cards (card_number, card_status, bank_account_id)
SELECT reverse(c.full_name), 'Active', c.id
FROM clients as c
WHERE c.id BETWEEN 191 and 200;

-- 03. Update
UPDATE employees_clients
set employee_id = (SELECT *
					FROM (SELECT employee_id 
					FROM employees_clients
                   	GROUP BY employee_id
                   	ORDER BY count(client_id), employee_id
                   	LIMIT 1) AS s)
WHERE client_id = employee_id;

-- 04.DELETE
DELETE e
from employees as e
LEFT JOIN employees_clients as ec on e.id = ec.employee_id
WHERE ec.client_id is NULL;
