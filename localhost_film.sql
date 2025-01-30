CREATE TABLE film(
filmID int PRIMARY KEY AUTO_INCREMENT,
filmNimetus varchar(30) not null,
aasta int,
eelarveHind decimal(7,1)
);
INSERT INTO film(filmNimetus, aasta, eelarveHind)
VALUES('Titanic', 2000, 20000.5),
('Barby', 2024, 555555.5);

CREATE TABLE zanr(
    zanrID INT PRIMARY KEY AUTO_INCREMENT,
    zanrNimetus VARCHAR(20) UNIQUE
);
INSERT INTO zanr(zanrNimetus)
VALUES ('draama'), ('detektiiv');


CREATE TABLE rezisoor(
    rezID INT PRIMARY KEY AUTO_INCREMENT,
    rezNimi VARCHAR(25) NOT NULL,
    rezSunniaeg INT,
    rezRiik VARCHAR(30)
);
INSERT INTO rezisoor(rezNimi, rezSunniaeg, rezRiik)
VALUES ('Nolan', 1970, 'London'),
       ('Dzekcon', 1961, 'New Zealand');


CREATE TABLE kinokava(
    kinokavaID INT PRIMARY KEY AUTO_INCREMENT,
    kinikavatime INT,
    filmID INT, 
    FOREIGN KEY (filmID) REFERENCES film(filmID) 
);
INSERT INTO kinokava (kinikavatime, filmID)
VALUES (1530, 1), (1800, 2);  -- Film 1 hakkab kell 15:30 ja Film 2 kell 18:00

