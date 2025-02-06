--SQL SALVESTATUD PROSEDUURID-- Funktioonid - mitu SQL käsku Käivitakse järjest
--SQL SERVER
CREATE DATABASE procTARgv24;

USE procTARgv24;
CREATE TABLE uudised(
uudisID int PRIMARY KEY identity(1,1),
uudiseTeema varchar(50),
kuupaev date,
autor varchar(25),
kirjeldus text
)
SELECT * FROM uudised;
INSERT INTO uudised(
uudiseTeema, kuupaev, autor, kirjeldus)
VALUES(
'udune ilm','2025-02-06','postimees','Lõunani on uudine ilm')
--protseduur
CREATE PROCEDURE lisaUudis
@uusTeema varchar(50),
@paev date,
@autor varchar(20),
@kirjeldus text
AS
BEGIN

INSERT INTO uudised(
uudiseTeema, kuupaev, autor, kirjeldus)
VALUES(
@uusTeema,@paev,@autor,@kirjeldus);
SELECT * FROM uudised;

END;
--kutse
EXEC lisaUudis 'windows 11', '2025-02-06', 'õpetaja Pant','jjj'
--teine kutse võimalus
EXEC lisaUudis @uusTeema='1.märts on juba kevad',
@paev='2025-02-06',
@autor='test',
@kirjeldus='puudub';
Drop PROCEDURE lisaUudis;


--protsedur, kustutamine tabelist id järgi
CREATE PROCEDURE kustutaUudis
@id int
AS
BEGIN
SELECT * FROM uudised;
DELETE FROM uudised WHERE uudisID=@id;
SELECT  * FROM uudised;
END;
--kutse
EXEC kustutaUudis 3;
EXEC kustutaUudis @id=3;

UPDATE uudised SET kirjeldus='uus kirjeldus'
WHERE kirjeldus Like'puudub'
SELECT * FROM uudised;

--protseduur mis uuendab andmed tabelis/UPDATE

CREATE Procedure uuendaKirjeldus
@uuskirjeldus text
AS
BEGIN
SELECT * FROM uudised;
UPDATE uudised SET kirjeldus=@uuskirjeldus
WHERE kirjeldus Like'puudub'
SELECT * FROM uudised;
END;
--kutse
EXEC uuendaKirjeldus 'uus tekst kirjelduses';
--protseduur mis otsib ja näitab uudist esimene tahte järgi

CREATE PROCEDURE otsingUudiseTeema
@taht char(1)
AS
BEGIN
SELECT * FROM uudised
WHERE uudiseTeema LIKE @taht +'%';
END;
--kutse
EXEC otsingUudiseTeema 'w';

--Xamp
CREATE TABLE uudised(
uudisID int PRIMARY KEY AUTO_INCREMENT,
uudiseTeema varchar(50),
kuupaev date,
autor varchar(25),
kirjeldus text
);
INSERT INTO uudised(
uudiseTeema, kuupaev, autor, kirjeldus)
VALUES(
'udune ilm','2025-02-06','postimees','Lõunani on uudine ilm');


CALL lisauudis ('windows 11', '2025-02-06', 'õpetaja Pant','jjj');
-- protseduurid

----Klassi ise töö---------

CREATE TABLE Mängud(
MänguID INT PRIMARY KEY IDENTITY(1,1),
nimi VARCHAR(100),
vakuupäev DATE,
zanr VARCHAR(50)
);

SELECT * FROM Mängud;

--protseduur, lisa uus mang
CREATE PROCEDURE LisaMängu
@nimi VARCHAR(100),
@vakuupäev DATE,
@zanr VARCHAR(50)
AS
BEGIN
INSERT INTO Mängud(
nimi,vakuupäev, zanr)
VALUES (
@nimi, @vakuupäev, @zanr);
SELECT* FROM Mängud;
END;
--kutse
EXEC LisaMängu'Cyberpunk 2077', '2020-12-10', 'Action RPG';

CREATE PROCEDURE LeiaMängIDJärgi
@MänguID INT
AS
BEGIN
SELECT * FROM Mängud
WHERE MänguID = @MänguID;
END;
--kutse
EXEC LeiaMängIDJärgi 1;

CREATE PROCEDURE VärskendaŽanr
@MänguID INT,
@UusŽanr VARCHAR(50)
AS
BEGIN
UPDATE Mängud
SET zanr = @UusŽanr
WHERE MänguID = @MänguID;
    -- Muudatuste kontrollimine
SELECT * FROM Mängud WHERE MänguID = @MänguID;
END;
--kutse
EXEC VärskendaŽanr 1, 'Sci-Fi RPG';
