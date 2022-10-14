-- 05. Clients
SELECT id, full_name
FROM clients
ORDER BY id ASC;

-- 06. Newbies
SELECT id, concat(first_name, ' ', last_name) as 'full_name', 
concat('$', salary) as 'salary', started_on
FROM employees
WHERE salary >= 100000 and started_on >= '2018-01-01'
ORDER BY salary DESC, id;
                    
-- 07. Cards against Humanity
SELECT cards.id, concat(cards.card_number, ' : ', c.full_name) as 'card_token'
FROM clients as c
JOIN bank_accounts as ba on c.id = ba.client_id
JOIN cards on cards.bank_account_id = ba.id
ORDER BY cards.id DESC;

-- 08. Top 5 Employees
SELECT concat(e.first_name, ' ', e.last_name) as 'name',e.started_on, count(c.id) as 'count_of_clients'
FROM employees as e
JOIN employees_clients as ec on e.id = ec.employee_id
JOIN clients as c on ec.client_id = c.id
GROUP BY e.id
ORDER BY count_of_clients DESC, e.id ASC
LIMIT 5;

-- 09. Branch cards
SELECT b.name, count(cards.id) as 'count_of_cards'
FROM branches as b
LEFT JOIN employees as e on e.branch_id = b.id
LEFT JOIN employees_clients as ec on e.id = ec.employee_id
LEFT JOIN clients as c on ec.client_id = c.id
LEFT JOIN bank_accounts as ba on c.id = ba.client_id
LEFT JOIN cards on ba.id = cards.bank_account_id
GROUP BY b.id
ORDER BY count_of_cards DESC, b.name;
