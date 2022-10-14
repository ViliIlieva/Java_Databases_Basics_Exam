CREATE TABLE branches (
id int PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(30) not null UNIQUE
);

CREATE TABLE employees (
id int PRIMARY KEY AUTO_INCREMENT, 
first_name VARCHAR(20) not null, 
last_name VARCHAR(20) not null, 
salary DECIMAL(10,2) not null, 
started_on DATE not null, 
branch_id int not null,
CONSTRAINT fk_employees_branches
FOREIGN KEY (branch_id) REFERENCES branches(id) 
);

CREATE TABLE clients (
id int PRIMARY KEY AUTO_INCREMENT, 
full_name VARCHAR(50) not null, 
age int not null
);

CREATE TABLE employees_clients (
employee_id int,
client_id int,
CONSTRAINT fk_employees
FOREIGN KEY (employee_id) REFERENCES employees(id),
CONSTRAINT fk_clients
FOREIGN KEY (client_id) REFERENCES clients(id)
);

CREATE TABLE bank_accounts (
id int PRIMARY KEY AUTO_INCREMENT, 
account_number VARCHAR(10) not null, 
balance DECIMAL (10,2) NOT NULL , 
client_id int not null UNIQUE,
CONSTRAINT fk_bank_accounts_clients
FOREIGN KEY (client_id) REFERENCES clients(id)
);

CREATE TABLE cards (
id int PRIMARY KEY AUTO_INCREMENT,
 card_number VARCHAR(19) not null,
 card_status VARCHAR(7) not null,
 bank_account_id int not NULL,
 CONSTRAINT fk_cards_bank_accounts
FOREIGN KEY (bank_account_id) REFERENCES bank_accounts(id)
 );
