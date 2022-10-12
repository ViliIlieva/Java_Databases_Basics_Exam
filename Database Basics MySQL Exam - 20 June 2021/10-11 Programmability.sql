-- 10. Find all courses by client’s phone number
delimiter ***
CREATE FUNCTION udf_courses_by_client (phone_num VARCHAR (20))  
RETURNS INT
DETERMINISTIC
	BEGIN
    DECLARE count INT;
    set count := 
    (SELECT count(co.id)   FROM clients as c
    JOIN courses as co ON c.id = co.client_id
    
    WHERE c.phone_number = `phone_num`);
		RETURN count;
    END
***
SELECT udf_courses_by_client ('(803) 6386812') as `count`; 
------------------------------------------------------------------------------------------

-- 11. Full info for address
delimiter ***
CREATE PROCEDURE udp_courses_by_address (address_name VARCHAR(100)) 
BEGIN
	SELECT a.name, c.full_name, 
	CASE WHEN cr.bill <= 20 THEN 'Low'
		 WHEN cr.bill <= 30 THEN 'Medium'
         ELSE 'High'
         END 'level_of_bill',
 cars.make, cars.condition, ca.name
	FROM addresses as a
	JOIN courses as cr on a.id = cr.from_address_id
	JOIN clients as c on cr.client_id = c.id
	JOIN cars on cr.car_id = cars.id
	JOIN categories as ca on cars.category_id = ca.id
	WHERE a.name = address_name
    ORDER BY cars.make, c.full_name;
END
***
CALL udp_courses_by_address('700 Monterey Avenue');
