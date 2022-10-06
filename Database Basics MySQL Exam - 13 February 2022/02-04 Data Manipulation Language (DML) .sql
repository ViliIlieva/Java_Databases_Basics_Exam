-- 02. Insert
INSERT INTO reviews (content, picture_url, published_at,rating)
SELECT left(p.description, 15), reverse(p.name), '2010-10-10', p.price / 8 
from products as p
WHERE p.id >= 5;

-- 03. Update
UPDATE products
set quantity_in_stock  = quantity_in_stock - 5
WHERE quantity_in_stock >= 60 AND quantity_in_stock <= 70;

-- 04. Delete
DELETE c
FROM customers as c
LEFT JOIN orders as o ON c.id = o.customer_id
WHERE o.customer_id IS NULL;
