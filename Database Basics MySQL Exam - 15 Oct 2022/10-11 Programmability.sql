-- 10. Extract bill
delimiter ***
CREATE FUNCTION udf_client_bill(full_name VARCHAR(50))  
RETURNS DECIMAL(19, 2)
DETERMINISTIC
BEGIN
    DECLARE bill DECIMAL(19, 2);
		SET bill := (SELECT  sum(p.price)
FROM clients as c
JOIN orders_clients as oc on c.id = oc.client_id
JOIN orders as o on oc.order_id = o.id
JOIN orders_products as op on o.id = op.order_id
JOIN products as p on op.product_id = p.id
WHERE concat(c.first_name, ' ', c.last_name) = full_name
GROUP BY c.id);
RETURN bill;
END
***
SELECT c.first_name,c.last_name, udf_client_bill('Silvio Blyth') as 'bill' FROM clients c
WHERE c.first_name = 'Silvio' AND c.last_name= 'Blyth';


-- 11. Happy hour
delimiter ***
CREATE PROCEDURE udp_happy_hour (`type` VARCHAR(50))
BEGIN
	UPDATE products as p
    SET p.price = p.price * 0.8
    WHERE p.type = `type` AND p.price >= 10;
END
***
CALL udp_happy_hour ('Cognac');
