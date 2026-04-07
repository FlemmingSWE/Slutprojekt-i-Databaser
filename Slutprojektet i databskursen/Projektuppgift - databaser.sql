CREATE DATABASE Planet_database;
USE Planet_database;

/* Skapar tabellen "Stars". "minimum_years" ser till att åldern på stjärnan som
 infogas i tabellen måste vara större än 0.0 */
CREATE TABLE Stars (
	star_id INT AUTO_INCREMENT PRIMARY KEY,
    star_name VARCHAR (255) UNIQUE NOT NULL,
    star_type VARCHAR (255) DEFAULT "Unknown startype",
    age_in_billion_years FLOAT NOT NULL,
    CONSTRAINT minimum_years CHECK (age_in_billion_years > 0.0)
    );

INSERT INTO stars (star_name, star_type, age_in_billion_years) VALUES
	("Sun", "G2 V, yellow dwarf main-sequence star", 4.5);

SELECT * FROM Stars;
COMMIT;

/* Skapar tabellen "planets". Innehåller samtidigt constraintsen "minimum_star_id",
"minimum_distance", "minimum_orbital_days" som ser till att "star_id", antalet km och 
antalet dagar som infogas i tabellen inte är negativ. */
CREATE TABLE planets (
	planet_id INT AUTO_INCREMENT PRIMARY KEY,
    star_id INT NOT NULL,
    CONSTRAINT minimum_star_id CHECK (star_id > 0),
    planet_name VARCHAR (255) UNIQUE NOT NULL,
    planet_type VARCHAR (255) DEFAULT "Okänd",
    distance_from_sun_billion_KM FLOAT NOT NULL,
    CONSTRAINT minimum_distance CHECK (distance_from_sun_billion_KM > 0),
    orbital_period_days FLOAT NOT NULL,
    CONSTRAINT minimum_orbital_days CHECK (orbital_period_days > 0),
    has_rings VARCHAR (10) NOT NULL,
    FOREIGN KEY (star_id) REFERENCES stars(star_id)
    );

SELECT * FROM planets;

# Infogar data i tabellen "planets"
INSERT INTO planets (star_id, planet_name, planet_type, distance_from_sun_billion_KM, orbital_period_days, has_rings) VALUES
	(1, "Mercury", "Terrestrial", 0.058, 88.0, "No"),
    (1, "Venus", "Terrestrial", 0.108, 225, "No"),
    (1, "Earth", "Terrestrial", 0.150, 365.25, "No"),
    (1, "Mars", "Terrestrial", 0.228, 687, "No"),
    (1, "Jupiter", "Gas giant", 0.778, 4333, "Yes"),
    (1, "Saturn", "Gas giant", 1.4, 10756, "Yes"),
    (1, "Uranus", "Ice giant", 2.9, 30687, "Yes"),
    (1, "Neptune", "Ice giant", 4.5, 60190, "Yes");

SELECT * FROM planets;

/* Skapar tabellen moons. "minimum_radius" ser till att den infogade radien för en måne inte 
får vara negativ.*/
CREATE TABLE Moons (
	moon_id INT AUTO_INCREMENT PRIMARY KEY,
    moon_name VARCHAR (255) NOT NULL UNIQUE,
    planet_id INT NOT NULL,
    mean_radius_in_km FLOAT,
    CONSTRAINT minimum_radius CHECK (mean_radius_in_km > 0),
    FOREIGN KEY (planet_id) REFERENCES planets (planet_id)
    );


# Infogar data i "moon" tabellen
INSERT INTO moons (moon_name, planet_id, mean_radius_in_km) VALUES
	("Moon", 3, 1737.4),
    ("Phobos", 4, 11.1),
    ("Deimos", 4, 6.27),
    ("Metis", 5, 21.5),
    ("Adrastea", 5, 8.2),
    ("Amalthea", 5, 83.5),
    ("Thebe", 5, 49.3),
    ("Io", 5, 1821.6),
    ("Europa", 5, 1560.8),
    ("Ganymede", 5, 2631.2),
    ("Callisto", 5, 2410.3),
    ("Themisto", 5, 4.0),
    ("Leda", 5, 10.0),
    ("S/2018 J2", 5, 3.0),
    ("Himalia", 5, 85.0),
    ("Ersa", 5, 3.0),
    ("Pandia", 5, 3.0),
    ("S/2011 J3", 5, 3.0),
    ("Lysithea", 5, 18.0),
    ("Elara", 5, 43.0),
    ("Dia", 5, 2.0),
    ("S/2018 J4", 5, 2.0),
    ("Carpo", 5, 1.5),
    ("Valetudo", 5, 1.0),
    ("S/2003 J12", 5, 0.5),
    ("Euporie", 5, 1.0),
    ("S/2003 J18", 5, 1.0),
    ("S/2010 J2", 5, 1.0),
    ("S/2017 J7", 5, 2.0),
    ("S/2016 J1", 5, 1.0),
    ("S/2017 J3", 5, 2.0),
    ("Orthosie", 5, 1.0),
    ("S/2021 J3", 5, 2.0),
    ("Euanthe", 5, 1.5),
    ("S/2021 J2", 5, 1.0),
    ("Thyone", 5, 2.0),
    ("S/2021 J1", 5, 1.0),
    ("S/2003 J16", 5, 2.0),
    ("S/2022 J3", 5, 1.0),
    ("Mneme", 5, 1.0),
    ("Harpalyke", 5, 2.2),
    ("Hermippe", 5, 2.0),
    ("Praxidike", 5, 3.4),
    ("Thelxinoe", 5, 1.0),
    ("Eupheme", 5, 1.0),
    ("Helike", 5, 2.0),
    ("Iocaste", 5, 2.6),
    ("Ananke", 5, 14.0),
    ("S/2017 J9", 5, 3.0),
    ("S/2003 J9", 5, 0.5),
    ("S/2017 J6", 5, 2.0),
    ("S/2011 J1", 5, 2.0),
    ("S/2016 J3", 5, 2.0),
    ("S/2022 J1", 5, 2.0),
    ("S/2003 J19", 5, 1.0),
    ("Philophrosyne", 5, 1.0),
    ("Eurydome", 5, 1.5),
    ("S/2021 J6", 5, 1.0),
    ("S/2003 J24", 5, 2.0),
    ("Arche", 5, 1.5),
    ("S/2022 J2", 5, 1.0),
    ("S/2021 J4", 5, 1.0),
    ("Autonoe", 5, 2.0),
    ("Pasithee", 5, 1.0),
    ("Herse", 5, 1.0),
    ("S/2016 J4", 5, 1.0),
    ("Chaldene", 5, 1.9),
    ("Isonoe", 5, 1.9),
    ("Kale", 5, 1.0),
    ("Aitne", 5, 1.5),
    ("S/2017 J5", 5, 2.0),
    ("S/2017 J8", 5, 1.0),
    ("S/2003 J4", 5, 1.0),
    ("Erinome", 5, 1.6),
    ("S/2017 J2", 5, 2.0),
    ("S/2010 J1", 5, 2.0),
    ("Taygete", 5, 2.5),
    ("S/2018 J3", 5, 1.0),
    ("Carme", 5, 23.0),
    ("S/2021 J5", 5, 2.0),
    ("S/2011 J2", 5, 1.0),
    ("Sponde", 5, 1.0),
    ("S/2017 J1", 5, 2.0),
    ("Kalyke", 5, 2.6),
    ("Pasiphae", 5, 30.0),
    ("Eukelade", 5, 2.0),
    ("Eirene", 5, 2.0),
    ("Megaclite", 5, 2.7),
    ("Sinope", 5, 19.0),
    ("Hegemone", 5, 1.0),
    ("Aoede", 5, 2.0),
    ("Kallichore", 5, 1.0),
    ("S/2003 J23", 5, 1.0),
    ("Callirrhoe", 5, 4.3),
    ("S/2003 J10", 5, 1.0),
    ("Cyllene", 5, 1.0),
    ("Kore", 5, 1.0),
    ("S/2003 J2", 5, 1.0);

# Saturn moons
INSERT INTO moons (moon_name, planet_id, mean_radius_in_km) VALUES
	("S/2009 S1", 6, 0.15 ),
	("Pan", 6, 10),
	("Daphnis", 6, 3.5),
	("Atlas", 6, 16),
	("Prometheus", 6, 50),
	("Pandora", 6, 42),
	("Epimetheus", 6, 59.5),
	("Janus", 6, 89),
	("Aegaeon", 6, 0.25),
	("Mimas", 6, 198.5),
	("Methone", 6, 1.5),
	("Anthe", 6, 0.5),
	("Pallene", 6, 2),
	("Enceladus", 6, 249.5),
	("Tethys", 6, 530),
	("Calypso", 6, 9.5),
	("Telesto", 6, 12),
	("Polydeuces", 6, 2),
	("Dione", 6, 559),
	("Helene", 6, 16),
	("Rhea", 6, 764),
	("Titan", 6, 2575),
	("Hyperion", 6, 133),
	("Iapetus", 6, 718),
	("Kiviuq", 6, 8),
	("Ijiraq", 6, 6),
	("S/2019 S1", 6, 1.5),
	("S/2005 S4", 6, 2),
	("S/2020 S1", 6, 1),
	("Phoebe", 6, 120),
	("S/2006 S20", 6, 1.5),
	("S/2006 S9", 6, 1),
	("Paaliaq", 6, 11),
	("Skathi", 6, 4),
	("S/2007 S2", 6, 2),
	("S/2007 S7", 6, 1),
	("S/2007 S5", 6, 1),
	("S/2004 S37", 6, 2),
	("S/2004 S47", 6, 1),
	("Albiorix", 6, 16),
	("S/2004 S40", 6, 1),
	("S/2019 S2", 6, 1),
	("S/2007 S8", 6, 1),
	("Bebhionn", 6, 3),
	("S/2019 S3", 6, 1),
	("S/2020 S7", 6, 1),
	("Erriapus", 6, 5),
	("S/2004 S31", 6, 2),
	("S/2004 S29", 6, 2),
	("Siarnaq", 6, 20),
	("Skoll", 6, 3),
	("S/2004 S41", 6, 1),
	("S/2020 S3", 6, 1),
	("Tarvos", 6, 7.5),
	("S/2019 S4", 6, 1),
	("Tarqeq", 6, 3.5),
	("S/2019 S14", 6, 1),
	("S/2020 S2", 6, 1),
	("S/2020 S4", 6, 1),
	("S/2004 S42", 6, 1),
	("Greip", 6, 3),
	("Hyrrokkin", 6, 4),
	("S/2020 S5", 6, 1),
	("S/2004 S13", 6, 1.5),
	("S/2007 S6", 6, 1),
	("Mundilfari", 6, 3.5),
	("S/2006 S1", 6, 2.5),
	("Jarnsaxa", 6, 3),
	("S/2006 S10", 6, 1),
	("S/2004 S43", 6, 1),
	("S/2019 S5", 6, 1),
	("Narvi", 6, 3.5),
	("Gridr", 6, 2),
	("Bergelmir", 6, 3),
	("S/2007 S3", 6, 2.5),
	("Suttungr", 6, 3.5),
	("S/2004 S44", 6, 1.5),
	("S/2006 S11", 6, 1),
	("Eggther", 6, 2),
	("Hati", 6, 3),
	("S/2006 S12", 6, 1),
	("S/2004 S17", 6, 1.5),
	("S/2004 S12", 6, 2),
	("S/2019 S6", 6, 1),
	("S/2004 S45", 6, 1.5),
	("S/2006 S13", 6, 1),
	("Bestla", 6, 3.5),
	("S/2004 S46", 6, 1),
	("S/2019 S8", 6, 1),
	("Angrboda", 6, 1.5),
	("Farbauti", 6, 2.5),
	("Beli", 6, 1.5),
	("Thrymr", 6, 3.5),
	("S/2019 S7", 6, 1),
	("Gerd", 6, 1.5),
	("S/2019 S11", 6, 1),
	("S/2007 S9", 6, 1),
	("S/2019 S9", 6, 1),
	("Aegir", 6, 3),
	("S/2019 S10", 6, 1),
	("S/2019 S12", 6, 1),
	("S/2019 S13", 6, 1),
	("S/2005 S5", 6, 1),
	("S/2020 S6", 6, 1),
	("S/2006 S14", 6, 1),
	("S/2019 S15", 6, 1),
	("S/2006 S3", 6, 2.5),
	("Skrymir", 6, 2),
	("Gunnlod", 6, 2),
	("S/2004 S07", 6, 2.5),
	("S/2006 S15", 6, 1),
	("S/2004 S28", 6, 2),
	("S/2020 S8", 6, 1),
	("Alvaldi", 6, 2),
	("S/2006 S16", 6, 1),
	("S/2004 S50", 6, 1),
	("Kari", 6, 3.5),
	("S/2004 S48", 6, 1.5),
	("Fenrir", 6, 2),
	("S/2006 S17", 6, 1.5),
	("Surtur", 6, 3),
	("S/2004 S39", 6, 1),
	("S/2004 S49", 6, 1),
	("Geirrod", 6, 2),
	("Ymir", 6, 9),
	("Loge", 6, 3),
	("S/2004 S24", 6, 1.5),
	("S/2006 S19", 6, 1),
	("S/2019 S17", 6, 1.5),
	("S/2006 S18", 6, 1.5),
	("S/2019 S19", 6, 1),
	("S/2019 S20", 6, 1),
	("S/2019 S18", 6, 1),
	("S/2004 S36", 6, 1.5),
	("S/2019 S16", 6, 1),
	("Thiazzi", 6, 2),
	("S/2004 S21", 6, 1.5),
	("S/2004 S53", 6, 1),
	("S/2004 S34", 6, 1.5),
	("Fornjot", 6, 3),
	("S/2020 S10", 6, 1),
	("S/2004 S51", 6, 1.5),
	("S/2020 S9", 6, 1),
	("S/2019 S21", 6, 1),
	("S/2004 S52", 6, 1),
	("S/2004 S26", 6, 2);

SELECT * FROM moons;
COMMIT;

# Uranus moons
INSERT INTO moons (moon_name, planet_id, mean_radius_in_km) VALUES
	("Cordelia", 7, 20),
	("Ophelia", 7, 21),
	("Bianca", 7, 26),
	("Cressida", 7, 40),
	("Desdemona", 7, 32),
	("Juliet", 7, 47),
	("Portia", 7, 68),
	("Rosalind", 7, 36),
	("Cupid", 7, 5),
	("Belinda", 7, 40),
	("Perdita", 7, 10),
	("Puck", 7, 81),
	("Mab", 7, 5),
	("Miranda", 7, 235.7), 
	("Ariel", 7, 578.9),
	("Umbriel", 7, 584.7), 
	("Titania", 7, 788.9), 
	("Oberon", 7, 761.4),
	("Francisco", 7, 11),
	("Caliban", 7, 36),
	("Stephano", 7, 16),
	("Trinculo", 7, 9),
	("Sycorax", 7, 75),
	("Margaret", 7, 10),
	("Prospero", 7, 25),
	("Setebos", 7, 24),
	("Ferdinand", 7, 10);
    
# Neptune moons
INSERT INTO moons (moon_name, planet_id, mean_radius_in_km) VALUES
	("Naiad", 8, 33),
	("Thalassa", 8, 41),
	("Despina", 8, 76),
	("Galatea", 8, 88),
	("Larissa", 8, 98),
	("Hippocamp", 8, 17.00),
	("Proteus", 8, 210),
	("Triton", 8,  1350 ),
	("Nereid", 8, 170),
	("Halimede", 8, 31),
	("Sao", 8, 22),
	("Laomedeia", 8, 21.00),
	("Psamathe", 8, 20),
	("Neso", 8, 30);

CREATE TABLE planet_discovery_log (
	discovery_log_id INT AUTO_INCREMENT PRIMARY KEY,
    planet_name VARCHAR (255),
    time_added TIMESTAMP DEFAULT CURRENT_TIMESTAMP);

SELECT * FROM planet_discovery_log;


DELIMITER $

# Trigger som loggar varje ny planet som läggs till.
CREATE TRIGGER planet_discovered
AFTER INSERT ON planets
FOR EACH ROW 
BEGIN
	INSERT INTO planet_discovery_log(planet_name)
    VALUES (NEW.planet_name);
END $

DELIMITER ;

/* Utgår från tabellen "planets" och visar ifall en planet har en måne
och om den isåfall har en kommer "count" att räkna antalet. */
SELECT p.planet_name, COUNT(m.moon_id) AS amount_of_moons
FROM planets p
INNER JOIN moons m ON p.planet_id = m.planet_id
GROUP BY p.planet_name;

/* Visar medelsnittsradien för varje måne som tillhör en viss planet */
SELECT p.planet_name, AVG(m.mean_radius_in_km) AS average_moon_radius_in_km
FROM planets p
INNER JOIN moons m ON p.planet_id = m.planet_id
GROUP BY p.planet_name;

# STORED PROCEDURE
DELIMITER //
CREATE PROCEDURE find_planet (IN search_planet VARCHAR (255))
	BEGIN
		SELECT * FROM planets
        WHERE planet_name = search_planet;
    END //
DELIMITER ;

CALL find_planet ("mars");

# Skapar användare 
CREATE USER "Kalle"@"localhost" IDENTIFIED BY "password";

# Creates user and grants user "Kalle" permission to display data from tables
GRANT SELECT ON planet_database.* TO "Kalle"@"localhost";

# Revokes said permissions from user "Kalle"
REVOKE SELECT ON planet_database.* FROM "Kalle"@"localhost";