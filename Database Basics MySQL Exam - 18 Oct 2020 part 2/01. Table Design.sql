CREATE DATABASE exam;

CREATE TABLE pictures (
id int PRIMARY KEY AUTO_INCREMENT, 
url VARCHAR(100) not null, 
added_on DATETIME not null
);

CREATE table categories (
id int PRIMARY KEY AUTO_INCREMENT, 
`name` VARCHAR(40) not null UNIQUE
);

CREATE TABLE products (
id int PRIMARY KEY AUTO_INCREMENT,  
`name` varchar(40) not null UNIQUE, 
best_before DATE, 
price DECIMAL(10,2) not null, 
`description` TEXT, 
category_id int NOT NULL,
picture_id INT NOT NULL,
CONSTRAINT fk_products_categories
FOREIGN KEY (category_id) REFERENCES categories(id),
CONSTRAINT fk_products_pictures
FOREIGN KEY (picture_id) REFERENCES pictures(id)
);

CREATE TABLE towns (
id int PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(20) not null UNIQUE
);

CREATE TABLE addresses (
id int PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(50) not null UNIQUE,
town_id INT not NULL,
CONSTRAINT fk_addresses_towns
FOREIGN KEY (town_id) REFERENCES towns(id)
);

CREATE TABLE stores (
id int PRIMARY KEY AUTO_INCREMENT, 
`name` VARCHAR(20) NOT NULL UNIQUE, 
rating FLOAT NOT NULL, 
has_parking BOOLEAN DEFAULT FALSE, 
address_id INT not null,
CONSTRAINT fk_stores_addresses
FOREIGN KEY (address_id) REFERENCES addresses(id)
);

CREATE TABLE products_stores (
product_id INT NOT NULL, 
store_id INT NOT NULL,
CONSTRAINT pk_products_stores
PRIMARY KEY (product_id, store_id),
CONSTRAINT fk_products
FOREIGN KEY (product_id) REFERENCES products(id),
CONSTRAINT fk_stores
FOREIGN KEY (store_id) REFERENCES stores(id)
);

CREATE TABLE employees (
id int PRIMARY KEY AUTO_INCREMENT, 
first_name VARCHAR(15) not null, 
middle_name CHAR, 
last_name VARCHAR(20) not NULL, 
salary DECIMAL(19, 2) DEFAULT 0 , 
hire_date DATE NOT NULL, 
manager_id int, 
store_id int not null,
CONSTRAINT fk_employees_stores
FOREIGN KEY (store_id) REFERENCES stores(id),
CONSTRAINT fk_employees_managers
FOREIGN KEY (manager_id) REFERENCES employees(id)
);
