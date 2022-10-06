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

