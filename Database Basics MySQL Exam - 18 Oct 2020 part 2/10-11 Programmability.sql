-- 10. Find name of top paid employee by store name
delimiter ***
CREATE FUNCTION udf_top_paid_employee_by_store(store_name VARCHAR(50))
RETURNS VARCHAR(50)
DETERMINISTIC
		BEGIN
	DECLARE full_info VARCHAR (300);
	DECLARE full_name VARCHAR (70);
	DECLARE years_of_experience VARCHAR (4);
	
	SET full_name := (SELECT concat_ws(' ', first_name, concat(middle_name, '.'), last_name)
        	FROM employees as e
        	JOIN stores AS s ON e.store_id = s.id
            WHERE s.name = store_name 
            ORDER BY salary DESC
            LIMIT 1);
  	SET years_of_experience := (SELECT floor(datediff('2020-10-18', e.hire_date)/365)
        	FROM employees as e
        	JOIN stores AS s ON e.store_id = s.id
        	WHERE s.name = store_name
            ORDER BY salary DESC
            LIMIT 1);
  	SET full_info := concat_ws(' ', full_name, 'works in store for', years_of_experience, 'years');
  	RETURN full_info;
END
***
SELECT udf_top_paid_employee_by_store('Stronghold') as 'full_info';
---------------------------------------------------------------------------------------------------

-- 11. Update product price by address
delimiter ***
CREATE PROCEDURE udp_update_product_price (address_name VARCHAR (50))
BEGIN
	UPDATE products as p
	JOIN products_stores as ps on p.id = ps.product_id
	JOIN stores as s on ps.store_id = s.id
	JOIN addresses as a on s.address_id = a.id
    set p.price = if(a.name like '0%', p.price + 100, p.price + 200) 
    WHERE a.name = address_name;
    end
***
