delimiter ***
CREATE FUNCTION udf_customer_products_count(`name` VARCHAR(30)) 
RETURNS INT
DETERMINISTIC
	BEGIN
    DECLARE total_products INT;
    set total_products := 
    (SELECT count(o.customer_id)   FROM customers as c
    JOIN orders as o ON c.id = o.customer_id
    JOIN orders_products as op ON o.id = op.order_id
    WHERE c.first_name = `name`);
		RETURN total_products;
    END
***
SELECT c.first_name,c.last_name, udf_customer_products_count('Shirley') as `total_products` FROM customers c
WHERE c.first_name = 'Shirley';
