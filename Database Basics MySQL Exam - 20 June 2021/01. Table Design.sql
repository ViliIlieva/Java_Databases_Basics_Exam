CREATE TABLE addresses (
id int PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(100) NOT NULL
);

CREATE TABLE categories (
id INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(10) NOT NULL
);

CREATE TABLE clients (
id INT PRIMARY KEY AUTO_INCREMENT,
full_name VARCHAR(50) NOT NULL, 
phone_number VARCHAR(20) not null
);

CREATE TABLE drivers (
id INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(30) NOT NULL, 
last_name VARCHAR(30) NOT NULL, 
age INT not NULL, 
rating FLOAT DEFAULT 5.5
);

CREATE TABLE cars (
id INT PRIMARY KEY AUTO_INCREMENT,
make VARCHAR(20) NOT NULL, 
model VARCHAR(20), 
`year` INT not null DEFAULT 0, 
mileage INT DEFAULT 0, 
`condition` CHAR not null, 
category_id INT NOT NULL,
CONSTRAINT fk_cars_categories
FOREIGN KEY (category_id) REFERENCES categories(id)
);

CREATE TABLE courses (
id INT PRIMARY KEY AUTO_INCREMENT,
from_address_id INT not null, 
`start` DATETIME not NULL, 
car_id INT not null, 
client_id INT not null, 
bill DECIMAL(10,2) DEFAULT 10,
CONSTRAINT fk_courses_addresses
FOREIGN KEY (from_address_id) REFERENCES addresses(id),
CONSTRAINT fk_courses_cars
FOREIGN KEY (car_id) REFERENCES cars(id),
CONSTRAINT fk_courses_clients
FOREIGN KEY (client_id) REFERENCES clients(id)
);

CREATE TABLE cars_drivers (
car_id INT not null, 
driver_id INT NOT NULL,
CONSTRAINT pk_cars_drivers
PRIMARY KEY (car_id, driver_id),
CONSTRAINT fk_cars_drivers
FOREIGN KEY (car_id) REFERENCES cars(id),
CONSTRAINT fk_drivers_cars
FOREIGN KEY (driver_id) REFERENCES drivers(id)
);
