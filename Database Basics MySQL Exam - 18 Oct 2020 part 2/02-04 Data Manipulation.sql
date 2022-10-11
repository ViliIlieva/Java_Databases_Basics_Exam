-- 02.Insert
INSERT INTO products_stores  (product_id, store_id)
SELECT p.id, 1
FROM products as p
LEFT JOIN products_stores as ps on p.id = ps.product_id
WHERE ps.store_id IS NULL;

-- 03.Update
UPDATE employees
set manager_id = 3, salary = salary - 500
WHERE year(hire_date) > 2003 and store_id NOT in (5,14);

-- 04. Delete
DELETE FROM employees
where manager_id is NOT NULL and salary > 6000;
