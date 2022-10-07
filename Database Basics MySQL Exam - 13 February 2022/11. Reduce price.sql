-- 11. Reduce price
delimiter ***
CREATE PROCEDURE udp_reduce_price(category_name VARCHAR(50)) 
BEGIN
	update products as p
	JOIN categories as c on c.id = p.category_id
	JOIN reviews as r ON p.review_id = r.id
		SET p.price = p.price*0.7
		WHERE c.name = category_name AND r.rating < 4;
END
***
CALL udp_reduce_price ('Phones and tablets');
