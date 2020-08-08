-- Create database

CREATE DATABASE TorneoTenis;

-- Create "Coach" Table 

CREATE TABLE Coach
(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR (30),
    last_name VARCHAR (30),
    PRIMARY KEY (id)
)
;

-- Create "Player" Table

CREATE TABLE Player
(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR (30),
    last_name VARCHAR (30),
    age INT(2), 
    PRIMARY KEY (id)
)
;

-- Create "Country" Table

CREATE TABLE Country
(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR (30),
    PRIMARY KEY (id)
)
;

-- Create "Round" Table

CREATE TABLE Round
(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR (30),
    prize_winner INT,
    prize_loser INT,
    PRIMARY KEY (id)
)
;

-- Create "Category" Table

CREATE TABLE Category
(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR (30),
    PRIMARY KEY (id)
)
;

-- Create "Referee" Table

CREATE TABLE Referee
(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR (30),
    last_name VARCHAR (30),
    PRIMARY KEY (id)
)
;

-- Create "Tournament" Table

CREATE TABLE Tournament
(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR (30),
    year INT (4),
    id_category INT,
    PRIMARY KEY (id),
    FOREIGN KEY (id_category) REFERENCES Category (id)
)
;

-- Create "City" Table

CREATE TABLE City
(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR (30),
    id_country INT,
    PRIMARY KEY (id),
    FOREIGN KEY (id_country) REFERENCES Country (id)
)
;

-- Create "Tournament_Cities" Table

CREATE TABLE Tournament_Cities
(
    id INT NOT NULL AUTO_INCREMENT,
    id_tournament INT,
    id_city INT,
    PRIMARY KEY (id),
    FOREIGN KEY (id_tournament) REFERENCES Tournament (id),
    FOREIGN KEY (id_city) REFERENCES City (id)
)
;

-- Create "Country_Players" Table

CREATE TABLE Country_Players
(
    id INT NOT NULL AUTO_INCREMENT,
    id_player INT,
    id_country INT,
    PRIMARY KEY (id),
    FOREIGN KEY (id_player) REFERENCES Player (id),
    FOREIGN KEY (id_country) REFERENCES Country (id)
)
;

-- Create "Coach_Players" Table

CREATE TABLE Coach_Players
(
    id INT NOT NULL AUTO_INCREMENT,
    id_coach INT,
    id_player INT,
    start_date DATE,
    end_date DATE, 
    PRIMARY KEY (id),
    FOREIGN KEY (id_player) REFERENCES Player (id),
    FOREIGN KEY (id_coach) REFERENCES Coach (id)
)
;

-- Create "Match" Table

CREATE TABLE Game
(
    id INT NOT NULL AUTO_INCREMENT,
    date DATE,
    id_round INT,
    id_tournament INT,
    PRIMARY KEY (id),
    FOREIGN KEY (id_round) REFERENCES Round (id),
    FOREIGN KEY (id_tournament) REFERENCES Tournament (id)
)
;

-- Create "Scores" Table

CREATE TABLE Scores
(
    id INT NOT NULL AUTO_INCREMENT,
    date DATE,
    id_game INT,
    id_player INT,
    PRIMARY KEY (id),
    FOREIGN KEY (id_game) REFERENCES Game (id),
    FOREIGN KEY (id_player) REFERENCES Player (id)
)
;

-- Create "Tournament_Players" Table

CREATE TABLE Tournament_Players
(
    id INT NOT NULL AUTO_INCREMENT,
    id_tournament INT,
    id_player INT,
    PRIMARY KEY (id),
    FOREIGN KEY (id_tournament) REFERENCES Tournament (id),
    FOREIGN KEY (id_player) REFERENCES Player (id)
)
;

-- Create "Referee_Games" Table

CREATE TABLE Referee_Games
(
    id INT NOT NULL AUTO_INCREMENT,
    id_referee INT,
    id_game INT,
    PRIMARY KEY (id),
    FOREIGN KEY (id_referee) REFERENCES Referee (id),
    FOREIGN KEY (id_game) REFERENCES Game (id)
)
;

-- Insert Data in Coach Table

INSERT INTO Coach (name, last_name)
VALUES 
    ('Jeff', 'Coetzee'),
    ('Paul', 'Annacone'),
    ('Leonardo', 'Alonzo'),
    ('Jose', 'Altur'),
    ('Carsten', 'Arriens'),
    ('Thierry', 'Ascione'),
    ('Benjamin', 'Balleret'),
    ('Fabian', 'Blengino'),
    ('Boris', 'Borgula'),
    ('Dante', 'Bottini')
;

-- Insert Data in Player Table

INSERT INTO Player (name, last_name, age)
VALUES
    ('Adrian', 'Mannarino', 32),
    ('Aisam', 'Ul', 40),
    ('Alejandro', 'Tabilo', 23),
    ('Alex', 'De', 21),
    ('Alexander', 'Bublik', 23),
    ('Aljaz', 'Bedene', 31),
    ('Andrey', 'Rublev', 22),
    ('Benoit', 'Paire', 31),
    ('Borna', 'Coric', 23),
    ('Cameron', 'Norrie', 24),
    ('Carlos', 'Alcaraz', 17),
    ('Cedrik', 'Marcel', 29),
    ('Christian', 'Garin', 24),
    ('Christopher', 'Rungkat', 30),
    ('Damir', 'Dzumhur', 28),
    ('Daniel', 'Evans', 30),
    ('Daniil', 'Medvedev', 24),
    ('Dusan', 'Lajovic', 30),
    ('Egor', 'Gerasimov', 27),
    ('Emil', 'Ruusuvuori', 21),
    ('Fabio', 'Fognini', 33),
    ('Filip', 'Krajinovic', 28),
    ('Frances', 'Tiafoe', 22),
    ('Frederico', 'Ferreira', 25),
    ('Guido', 'Pella', 30),
    ('Gunawan', 'Trismuwantara', 17),
    ('Hazem', 'Naw', 20),
    ('Hugo', 'Dellien', 27),
    ('Ilya', 'Ivashka', 26),
    ('Ivo', 'Karlovic', 41),
    ('Jeremy', 'Chardy', 33),
    ('Jiri', 'Vesely', 27),
    ('Joao', 'Domingues', 26),
    ('Jordan', 'Thompson', 26),
    ('Jose', 'Rubin', 33),
    ('Kyle', 'Edmund', 25),
    ('Lorenzo', 'Sonego', 25),
    ('Luis', 'David', 31),
    ('Lukas', 'Hellum', 19),
    ('Lukas', 'Rosol', 35),
    ('Mackenzie', 'McDonald', 25),
    ('Malek', 'Jaziri', 36),
    ('Marcelo', 'Arevalo', 29),
    ('Marcelo', 'Tomas', 22),
    ('Marin', 'Cilic', 31),
    ('Marton', 'Fucsovics', 28),
    ('Matteo', 'Berrettini', 24),
    ('Michael', 'Mmoh', 22),
    ('Mikael', 'Ymer', 21),
    ('Miomir', 'Kecmanovic', 20),
    ('Nick', 'Kyrgios', 25),
    ('Nikoloz', 'Basilashvili', 28),
    ('Novak', 'Djokovic', 33),
    ('Pablo', 'Cuevas', 34),
    ('Paolo', 'Lorenzi', 38),
    ('Patrik', 'Niklas', 23),
    ('Pedro', 'Sousa', 32),
    ('Pierre', 'Hugues', 29),
    ('Richard', 'Gasquet', 34),
    ('Roberto', 'Carballes', 27),
    ('Roberto', 'Marcora', 30),
    ('Roberto', 'Quiroz', 28),
    ('Roger', 'Federer', 38),
    ('Ruben', 'Bemelmans', 32),
    ('Sam', 'Querrey', 32),
    ('Steve', 'Johnson', 30),
    ('Taro', 'Daniel', 27),
    ('Tommy', 'Paul', 23),
    ('Vasek', 'Pospisil', 30),
    ('Viktor', 'Durasovic', 23),
    ('Viktor', 'Troicki', 34),
    ('Wilfredo', 'Gonzalez', 27),
    ('Wishaya', 'Trongcharoenchaikul', 25),
    ('Yuichi', 'Sugita', 31)
;

-- Insert Data in Country Table

INSERT INTO Country (name)
VALUES
    ('Afghanistan'),
    ('Albania'),
    ('Algeria'),
    ('America'),
    ('Andorra'),
    ('Angola'),
    ('Antigua'),
    ('Argentina'),
    ('Armenia'),
    ('Australia'),
    ('Austria'),
    ('Azerbaijan'),
    ('Bahamas'),
    ('Bahrain'),
    ('Bangladesh'),
    ('Barbados'),
    ('Belarus'),
    ('Belgium'),
    ('Belize'),
    ('Benin'),
    ('Bhutan'),
    ('Bissau'),
    ('Bolivia'),
    ('Bosnia'),
    ('Botswana'),
    ('Brazil'),
    ('British'),
    ('Brunei'),
    ('Bulgaria'),
    ('Burkina'),
    ('Burma'),
    ('Burundi'),
    ('Cambodia'),
    ('Cameroon'),
    ('Canada'),
    ('Cape Verde'),
    ('Central African Republic'),
    ('Chad'),
    ('Chile'),
    ('China'),
    ('Colombia'),
    ('Comoros'),
    ('Congo'),
    ('Costa Rica'),
    ('country debt'),
    ('Croatia'),
    ('Cuba'),
    ('Cyprus'),
    ('Czech'),
    ('Denmark'),
    ('Djibouti'),
    ('Dominica'),
    ('East Timor'),
    ('Ecuador'),
    ('Egypt'),
    ('El Salvador'),
    ('Emirate'),
    ('England'),
    ('Eritrea'),
    ('Estonia'),
    ('Ethiopia'),
    ('Fiji'),
    ('Finland'),
    ('France'),
    ('Gabon'),
    ('Gambia'),
    ('Georgia'),
    ('Germany'),
    ('Ghana'),
    ('Great Britain'),
    ('Greece'),
    ('Grenada'),
    ('Grenadines'),
    ('Guatemala'),
    ('Guinea'),
    ('Guyana'),
    ('Haiti'),
    ('Herzegovina'),
    ('Honduras'),
    ('Hungary'),
    ('Iceland'),
    ('in usa'),
    ('India'),
    ('Indonesia'),
    ('Iran'),
    ('Iraq'),
    ('Ireland'),
    ('Israel'),
    ('Italy'),
    ('Ivory Coast'),
    ('Jamaica'),
    ('Japan'),
    ('Jordan'),
    ('Kazakhstan'),
    ('Kenya'),
    ('Kiribati'),
    ('Korea'),
    ('Kosovo'),
    ('Kuwait'),
    ('Kyrgyzstan'),
    ('Laos'),
    ('Latvia'),
    ('Lebanon'),
    ('Lesotho'),
    ('Liberia'),
    ('Libya'),
    ('Liechtenstein'),
    ('Lithuania'),
    ('Luxembourg'),
    ('Macedonia'),
    ('Madagascar'),
    ('Malawi'),
    ('Malaysia'),
    ('Maldives'),
    ('Mali'),
    ('Malta'),
    ('Marshall'),
    ('Mauritania'),
    ('Mauritius'),
    ('Mexico'),
    ('Micronesia'),
    ('Moldova'),
    ('Monaco'),
    ('Mongolia'),
    ('Montenegro'),
    ('Morocco'),
    ('Mozambique'),
    ('Myanmar'),
    ('Namibia'),
    ('Nauru'),
    ('Nepal'),
    ('Netherlands'),
    ('New Zealand'),
    ('Nicaragua'),
    ('Niger'),
    ('Nigeria'),
    ('Norway'),
    ('Oman'),
    ('Pakistan'),
    ('Palau'),
    ('Panama'),
    ('Papua'),
    ('Paraguay'),
    ('Peru'),
    ('Philippines'),
    ('Poland'),
    ('Portugal'),
    ('Qatar'),
    ('Romania'),
    ('Russia'),
    ('Rwanda'),
    ('Samoa'),
    ('San Marino'),
    ('Sao Tome'),
    ('Saudi Arabia'),
    ('scotland'),
    ('scottish'),
    ('Senegal'),
    ('Serbia'),
    ('Seychelles'),
    ('Sierra Leone'),
    ('Singapore'),
    ('Slovakia'),
    ('Slovenia'),
    ('Solomon'),
    ('Somalia'),
    ('South Africa'),
    ('South Sudan'),
    ('Spain'),
    ('Sri Lanka'),
    ('St. Kitts'),
    ('St. Lucia'),
    ('St Kitts'),
    ('St Lucia'),
    ('Saint Kitts'),
    ('Santa Lucia'),
    ('Sudan'),
    ('Suriname'),
    ('Swaziland'),
    ('Sweden'),
    ('Switzerland'),
    ('Syria'),
    ('Taiwan'),
    ('Tajikistan'),
    ('Tanzania'),
    ('Thailand'),
    ('Tobago'),
    ('Togo'),
    ('Tonga'),
    ('Trinidad'),
    ('Tunisia'),
    ('Turkey'),
    ('Turkmenistan'),
    ('Tuvalu'),
    ('Uganda'),
    ('Ukraine'),
    ('United Kingdom'),
    ('United States'),
    ('Uruguay'),
    ('USA'),
    ('Uzbekistan'),
    ('Vanuatu'),
    ('Vatican'),
    ('Venezuela'),
    ('Vietnam'),
    ('wales'),
    ('welsh'),
    ('Yemen'),
    ('Zambia'),
    ('Zimbabwe')
;

-- Insert Data in Round Table

INSERT INTO Round (name, prize_winner, prize_loser)
VALUES 
    ('Final Singles', 3850000, 1900000),
    ('Semifinal Singles', 960000, 960000),
    ('Quarterfinals Singles', 500000, 500000),
    ('Fourth Singles', 280000, 280000),
    ('Third Singles', 163000, 163000),
    ('Second Singles', 100000, 100000),
    ('First Singles', 58000, 58000),
    ('Final Doubles', 740000, 370000),
    ('Semifinal Doubles', 175000, 175000),
    ('Quarterfinals Doubles', 91000, 91000),
    ('Third Doubles', 50000, 50000),
    ('Second Doubles', 30000, 30000),
    ('First Doubles', 17000, 17000)
;

-- Insert Data in Category Table

INSERT INTO Category (name)
VALUES 
    ('Singles'), 
    ('Doubles')
;

-- Insert Data in Referee Table

INSERT INTO Referee (name, last_name)
VALUES
    ('Ali', 'Nili'),
    ('Carlos', 'Bernardes'),
    ('Carlos', 'Ramos'),
    ('Cédric', 'Mourier'),
    ('Damian', 'Steiner'),
    ('Damien', 'Dumusois'),
    ('Emmanuel', 'Joseph'),
    ('Fergus', 'Murphy'),
    ('Gianluca', 'Moscarella'),
    ('Jake', 'Garner'),
    ('James', 'Keothavong'),
    ('John', 'Blom'),
    ('Kader', 'Nouni'),
    ('Manuel', 'Messina'),
    ('Mohamed', 'El'),
    ('Mohamed', 'Lahyani'),
    ('Pierre', 'Bacchi'),
    ('Renaud', 'Lichtenstein'),
    ('Roland', 'Herfel'),
    ('Juame', 'Campistol'),
    ('Adel', 'Nour'),
    ('Nico', 'Helwerth'),
    ('Alison', 'Hughes'),
    ('Eva', 'Asderaki-Moore'),
    ('Juan', 'Jennifer'),
    ('Louise', 'Engzell'),
    ('Mariana', 'Alves'),
    ('Marija', 'Čičak'),
    ('Marijana', 'Veljovic'),
    ('Julie', 'Kjendlie'),
    ('Aurélie', 'Tourte'),
    ('Paula', 'Vieira')
;

