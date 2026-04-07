# Slutprojekt-i-Databaser
Mitt slutprojekt i databaskursen som handlar om ett planetsystem

Reflektion av val av databasstruktur och säkerhetsåtgärder:

Jag har valt att designa min databas efter ett RDBMS i MySQL då planeter, stjärnor och månar har en relation till varandra som följer en
väldigt tydlig struktur.

Tabeller:
Databasen är uppdelad i 4 tabeller (stars, planets, moons och planet_discovery_log). Databasen är strukturerad på ett sådant sätt att en stjärna
kan ha många planeter som kretsar kring en men en planet kan bara kretsa kring en stjärna, med andra ord en till många relationer.


Säkerhetsåtgärder:
För att säkerstella dataintegriteten i databasen valde jag även att implementera olika constraints som ska hindra att felaktig data infogas i 
tabellerna. 

De olika constraints är följande:

PKs (Primary keys) & FKs (Foreign keys):

Genom att implementera PKs (Primary keys) på e.x. "planet_id" i tabellen "planets" och FKs (Foreign keys) på e.x. "planet_id" i tabellen "moons"
så ser vi till att tabellerna kan ha en relation till varandra. PKs och FKs är även superviktiga för den anledningen att de möjliggör JOINS för oss.

CHECK: "CONSTRAINT minimum_distance CHECK (distance_from_sun_billion_KM > 0)" constraints har jag skapat för att säkerstella att användaren av
databasen inte kan mata in ett negativt avstånd som en planet har från solen. En annan constraint jag valde att lägga till var 
"CONSTRAINT minimum_radius CHECK (mean_radius_in_km > 0)" som ser till att användaren inte kan mata in ett negativt värde för medelradien som en
måne har.

Jag har även valt att lägga till UNIQUE och NOT NULL vid skapandet av tabellerna. Det UNIQUE gör är att den säkerställer att data som infogas i en
kolumn måste vara unik och får inte vara likadan som någon annan i samma kolumn. E.x. i tabellen "moons" skapade jag en kolumn som heter "moon_name"
och satte att data som infogas i tabellen måste vara unikt (moon_name VARCHAR (255) NOT NULL UNIQUE,). I definitionen för tabellen så satte jag även
"NOT NULL" som ser till att data måste infogas i den här kolumnen.

Sedan skapade jag även tabell för loggning som loggar varje gång en ny planet läggs till. Med hjälp av triggers så loggas en ändring i tabellen
automatiskt. Ur en säkerhetssynpunkt kan detta vara en bra idé då det är bra att veta när ändringar genomförs i någon av tabellerna eller rättare
sagt i "planets" tabellen i det här fallet.


Analys av databasens prestanda:

Nu när databasen hanterar en sån liten mängd data så är det inte nödvändigt i dagsläget att implementera lösningar som gör att databasen presterar
bättre men om databasen i framtiden skulle behöve hantera en större mängd data så kan man skapa index på det användarna kan tänkas söka ofta på
vilket kan vara planeter. Sätter vi då index på kolumnen "planet_name" i tabellen "planets" så kommer användarna att få resultat mycket snabbare
när de söker på en planet. Skulle datamängden som databasen hanterar öka och vi inte hade satt index på e.x. kolumnen "planet_name" så hade
prestandan minskat avsevärt jämfört med om vi skulle ha ett index. 
