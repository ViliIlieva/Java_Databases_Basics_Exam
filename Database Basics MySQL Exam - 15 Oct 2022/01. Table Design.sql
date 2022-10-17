CREATE TABLE products (
id int PRIMARY KEY AUTO_INCREMENT, 
`name` VARCHAR(30) not null UNIQUE, 
`type` VARCHAR(30) not NULL, 
price DECIMAL(10,2) not null
);

CREATE TABLE clients (
id int PRIMARY KEY AUTO_INCREMENT, 
first_name VARCHAR(50) not null, 
last_name VARCHAR(50) not null, 
birthdate DATE not null, 
card VARCHAR(50), 
review TEXT
);

CREATE TABLE `tables` (
id int PRIMARY KEY AUTO_INCREMENT, 
floor int not null, 
reserved BOOLEAN, 
capacity int not null
);

CREATE TABLE waiters (
id int PRIMARY KEY AUTO_INCREMENT, 
first_name VARCHAR(50) not null, 
last_name VARCHAR(50) not null, 
email VARCHAR(50) not null, 
phone VARCHAR(50), 
salary DECIMAL(10,2)
);

CREATE TABLE orders (
id int PRIMARY KEY AUTO_INCREMENT, 
table_id int not null, 
waiter_id int not null, 
order_time TIME not null, 
payed_status BOOLEAN,
CONSTRAINT fk_orders_waiters
FOREIGN KEY (waiter_id) REFERENCES waiters(id),
CONSTRAINT fk_orders_tables
FOREIGN KEY (table_id) REFERENCES `tables`(id)
);

CREATE TABLE orders_clients (
order_id int, 
client_id int,
CONSTRAINT fk_orders_clients
FOREIGN KEY (order_id) REFERENCES orders(id),
CONSTRAINT fk_clients
FOREIGN KEY (client_id) REFERENCES clients(id)
);

CREATE TABLE orders_products (
order_id INT, 
product_id int,
CONSTRAINT fk_orders_products
FOREIGN KEY (order_id) REFERENCES orders(id),
CONSTRAINT fk_products
FOREIGN KEY (product_id) REFERENCES products(id)
);
