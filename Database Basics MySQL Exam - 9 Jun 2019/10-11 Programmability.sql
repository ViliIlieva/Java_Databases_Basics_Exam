-- 10. Extract card's count
delimiter ***
CREATE FUNCTION udf_client_cards_count(`name` VARCHAR(30)) 
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE cards int;
		SET cards := (SELECT count(c.id) 
		from clients as c
		JOIN bank_accounts as ba on ba.client_id = c.id
		JOIN cards on cards.bank_account_id = ba.id
		WHERE c.full_name = `name`);
RETURN cards;
END
***
SELECT c.full_name, udf_client_cards_count('Baxy David') as `cards` FROM clients c
WHERE c.full_name = 'Baxy David';

-- 11. Client Info
delimiter ***
CREATE PROCEDURE udp_clientinfo (full_name VARCHAR(100))
BEGIN
	SELECT c.full_name, c.age, ba.account_number, concat('$', ba.balance) as 'balance'
	from clients as c
	JOIN bank_accounts as ba on ba.client_id = c.id
	WHERE c.full_name = full_name;
END
***
CALL udp_clientinfo ('Hunter Wesgate');
