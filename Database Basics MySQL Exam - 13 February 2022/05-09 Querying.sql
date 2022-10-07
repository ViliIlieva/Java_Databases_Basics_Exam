-- 05. Categories
SELECT *
FROM categories
ORDER BY `name` DESC;

-- 06. Quantity
SELECT id, brand_id, `name`, quantity_in_stock
FROM products
WHERE price > 1000 AND quantity_in_stock < 30
ORDER BY quantity_in_stock ASC, id;

-- 07. Review
SELECT * 
FROM reviews
WHERE content like 'My%' and length(content) > 61
ORDER BY rating DESC;

-- 08. First customers
SELECT concat(c.first_name, ' ', c.last_name) as 'full_name', c.address, o.order_datetime
FROM customers as c
JOIN orders as o ON c.id = o.customer_id
WHERE year(o.order_datetime) <= '2018'
ORDER BY full_name DESC;

-- 09. Best categories
SELECT count(p.id) as 'items_count', c.name, sum(p.quantity_in_stock) as 'total_quantity'
FROM products as p
JOIN categories as c ON p.category_id = c.id
GROUP BY c.id
ORDER BY items_count DESC, total_quantity ASC
LIMIT 5;
