-- 05. Cars
SELECT c.make, c.model, c.condition
FROM cars as c
ORDER BY c.id;

-- 06. Drivers and Cars
SELECT d.first_name, d.last_name, c.make, c.model, c.mileage
FROM drivers as d
JOIN cars_drivers as cd on d.id = cd.driver_id
JOIN cars as c on cd.car_id = c.id
WHERE c.mileage is not null
ORDER BY c.mileage DESC, d.first_name;

-- 07. Number of courses
SELECT c.id, c.make, c.mileage, count(cr.id) as 'count_of_courses', round(avg(cr.bill), 2) as 'count_of_courses'
FROM cars as c
left JOIN courses as cr on c.id = cr.car_id
GROUP BY c.id
HAVING count_of_courses <> 2
ORDER BY count_of_courses DESC, c.id;

-- 08. Regular clients
SELECT c.full_name , count(cr.car_id) as 'count_of_cars', sum(cr.bill)
from clients as c
JOIN courses as cr on c.id = cr.client_id
JOIN cars on cr.car_id = cars.id
GROUP BY cr.client_id
HAVING c.full_name LIKE '_a%' and count_of_cars > 1
ORDER BY c.full_name;

-- 09. Full info for courses
SELECT a.name, 
	CASE WHEN hour(cr.start) BETWEEN 6 and 20  THEN 'Day'
		 ELSE 'Night' END	
as 'day_time', cr.bill, c.full_name, cars.make, cars.model, ca.name
FROM addresses as a
JOIN courses as cr on a.id = cr.from_address_id
JOIN clients as c on cr.client_id = c.id
JOIN cars on cr.car_id = cars.id
JOIN categories as ca on cars.category_id = ca.id
ORDER BY cr.id;
