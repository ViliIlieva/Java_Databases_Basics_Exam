-- 05. Employees
SELECT first_name, middle_name, last_name, salary, hire_date
FROM employees
ORDER BY hire_date DESC;

-- 06. Products with old pictures
SELECT p.name, p.price, p.best_before, 
concat(left(p.description, 10), '...') as 'short_description', pc.url
from products as p
join pictures as pc on p.picture_id = pc.id
WHERE length(p.description) > 100 and year(pc.added_on) < 2019 and p.price > 20
ORDER BY p.price DESC;

-- 07. Counts of products in stores
SELECT s.name, count(p.id) as 'product_count', round(avg(p.price), 2) as 'avg'
FROM stores as s
LEFT JOIN products_stores as ps on s.id = ps.store_id
left JOIN products as p on ps.product_id = p.id
GROUP BY s.id
ORDER BY product_count DESC, avg DESC, s.id;

-- 08. Specific employee
SELECT concat(e.first_name, ' ', e.last_name) as 'Full_name',
 s.name as 'Store_name', a.name as 'address', e.salary
FROM employees as e
JOIN stores as s on e.store_id = s.id
JOIN addresses as a on s.address_id = a.id
WHERE e.salary < 4000 and  a.name LIKE '%5%' and length(s.name) > 8 and e.last_name LIKE '%n';

-- 09. Find all information of stores
SELECT  reverse(s.name) as 'reversed_name',
concat(upper(t.name), '-', a.name) as 'full_address', count(e.id) 'employees_count' 
FROM employees as e
JOIN stores as s on e.store_id = s.id
JOIN addresses as a on s.address_id = a.id
JOIN towns as t on a.town_id = t.id
GROUP BY s.id
HAVING employees_count >= 1
ORDER BY full_address ASC;
