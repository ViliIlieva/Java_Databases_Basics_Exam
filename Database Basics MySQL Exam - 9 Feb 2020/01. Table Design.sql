CREATE TABLE skills_data (
id int PRIMARY KEY AUTO_INCREMENT, 
dribbling int DEFAULT 0, 
pace int DEFAULT 0, 
passing int DEFAULT 0, 
shooting int DEFAULT 0, 
speed int DEFAULT 0, 
strength int DEFAULT 0
);

CREATE TABLE coaches (
id int PRIMARY KEY AUTO_INCREMENT, 
first_name VARCHAR(10) not NULL, 
last_name VARCHAR(20) not NULL,
salary DECIMAL(10,2) DEFAULT 0 not null ,
coach_level int DEFAULT 0 not NULL
);

CREATE TABLE countries (
id int PRIMARY KEY AUTO_INCREMENT, 
name VARCHAR(45) not NULL
);

CREATE TABLE towns (
id int PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(45) not NULL,
 country_id int not null,
 CONSTRAINT fk_towns_countries
FOREIGN KEY (country_id) REFERENCES countries(id)
 );

CREATE TABLE stadiums (
id int PRIMARY KEY AUTO_INCREMENT, 
`name` VARCHAR(45) not NULL,
capacity int not null, 
town_id int not null,
CONSTRAINT fk_stadiums_towns
FOREIGN KEY (town_id) REFERENCES towns(id)
);

CREATE TABLE teams (
id int PRIMARY KEY AUTO_INCREMENT, 
`name` VARCHAR(45) not NULL, 
established DATE not null, 
fan_base BIGINT not null DEFAULT 0, 
stadium_id int not null,
CONSTRAINT fk_teams_stadiums
FOREIGN KEY (stadium_id) REFERENCES stadiums(id)
);

CREATE TABLE players (
id int PRIMARY KEY AUTO_INCREMENT, 
first_name VARCHAR(10) not NULL, 
last_name VARCHAR(20) not null, 
age INT DEFAULT 0 not NULL, 
position char not null, 
salary DECIMAL(10,2) DEFAULT 0 not NULL, 
hire_date DATETIME, 
skills_data_id INT NOT NULL, 
team_id INT ,
CONSTRAINT fk_players_skills_data
FOREIGN KEY (skills_data_id) REFERENCES skills_data(id),
CONSTRAINT fk_players_teams
FOREIGN KEY (team_id) REFERENCES teams(id)
);

CREATE table players_coaches(
player_id  INT, 
coach_id int,
CONSTRAINT pk_player_coaches
PRIMARY KEY (player_id, coach_id),
CONSTRAINT fk_players
FOREIGN KEY (player_id) REFERENCES players(id),
CONSTRAINT fk_coaches
FOREIGN KEY (coach_id) REFERENCES coaches(id)
);
