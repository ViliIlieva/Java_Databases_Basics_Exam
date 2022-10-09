CREATE DATABASE ep_06_august_2021;

CREATE TABLE addresses (
id int PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(50) NOT NULL
);


CREATE TABLE `categories` (
id int PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(10) not null
);

CREATE TABLE offices (
id INT PRIMARY KEY AUTO_INCREMENT,
workspace_capacity INT not null, 
website VARCHAR(50), 
address_id int not null,
CONSTRAINT fk_offices_addresses
	FOREIGN KEY (address_id) REFERENCES addresses(id)
); 

CREATE TABLE employees (
id int PRIMARY KEY AUTO_INCREMENT,
first_name varchar(30) not null, 
last_name varchar(30) not null, 
age INT NOT NULL, 
salary DECIMAL(10,2) NOT NULL, 
job_title VARCHAR(20) NOT NULL, 
happiness_level CHAR NOT NULL
);

CREATE TABLE teams (
id INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(40) NOT NULL, 
office_id INT NOT NULL, 
leader_id INT UNIQUE,
CONSTRAINT fk_teams_offices
	FOREIGN KEY (office_id) REFERENCES offices(id),
CONSTRAINT fk_teams_employees
	FOREIGN KEY (leader_id) REFERENCES employees(id)
);

CREATE TABLE games (
id INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(50) NOT NULL UNIQUE, 
`description` TEXT, 
rating FLOAT DEFAULT '5.5' NOT NULL, 
budget DECIMAL (10,2) NOT NULL, 
release_date DATE, 
team_id INT NOT NULL,
CONSTRAINT fk_games_teams
	FOREIGN KEY (team_id) REFERENCES teams(id)
); 

CREATE TABLE games_categories (
game_id INT not NULL, 
category_id INT not NULL,
CONSTRAINT pk_games_categories
	PRIMARY KEY(game_id, category_id),
CONSTRAINT fk_games_categories
	FOREIGN KEY (game_id) REFERENCES games(id),
CONSTRAINT fk_categories_games
	FOREIGN KEY (category_id) REFERENCES categories(id)
);
