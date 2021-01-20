CREATE DATABASE DBVoiture
use DBVoiture
CREATE TABLE voiture(matricule int primary key,
                     marque VARCHAR(40),
                     typevoiture VARCHAR(40),
                     couleur VARCHAR(40),
                     kilometrage INT,
                     dateprod DATE)
SELECT * FROM voiture                     
------- Remplisage-------
INSERT INTO voiture VALUES(1,'Ford','Essence','blanche',200,'10/10/2000')
INSERT INTO voiture VALUES(2,'Dacia','Dieselle','noire',100,'10/10/2009')
INSERT INTO voiture VALUES(3,'BMW','Essence','blue',240,'10/10/2010')
INSERT INTO voiture VALUES(4,'Firari','Dieselle','rouge',300,'10/10/2004')

--------------------------------------------------------------------------
DROP TABLE voiture ---- supprimer la table voiture
CREATE TABLE voiture(matricule int primary key IDENTITY,
                     marque VARCHAR(40),
                     typevoiture VARCHAR(40),
                     couleur VARCHAR(40),
                     kilometrage INT,
                     dateprod DATE)

-------- Remplisage--------
INSERT INTO voiture VALUES('Ford','Essence','blanche',200,'10/10/2000')
INSERT INTO voiture VALUES('Dacia','Dieselle','noire',100,'10/10/2009')
INSERT INTO voiture VALUES('BMW','Essence','blue',240,'10/10/2010')
INSERT INTO voiture VALUES('Firari','Dieselle','rouge',300,'10/10/2004')   

INSERT INTO voiture VALUES('TOYOTA', 'Dieselle','blanche',220,'09/26/2012')
INSERT INTO voiture(marque,typevoiture,kilometrage) VALUES('KIA','Essence',150)

--------------------------------------------------------------------------------
-- Req 1 : la table voiture 
SELECT * FROM voiture
-- Req 2 : les voiture de type essence 
SELECT * FROM voiture WHERE typevoiture LIKE 'Essence'
-- Req 3 : les voiture de type essence et marque Ford
SELECT * FROM  voiture WHERE typevoiture LIKE 'Essence' AND marque LIKE 'Ford'
-- Req 4 : les voiture de kilometrage entre 100 et 200 
SELECT * FROM voiture WHERE kilometrage BETWEEN 100 and 200
-- Req 5 : le nombre de voitures blanches
SELECT COUNT(*) 'Nombre blanche'
FROM voiture 
WHERE couleur LIKE 'blanche'
-- Req 6 : les differentes marque et calculer le nombre 
SELECT COUNT(distinct marque) AS 'Diff marque'
FROM voiture

SELECT COUNT(marque) FROM voiture

SELECT marque FROM voiture

-- Req 7 : Afficher les voiture en ordre  croissant du kilometrage
SELECT * FROM voiture
ORDER BY kilometrage 

-- Req 8 : Afficher les voiture en ordre  decroissant du kilometrage
SELECT * FROM voiture
ORDER BY kilometrage DESC

-- Req 9 : Afficher les voiture produites en 2000
SELECT* ,YEAR(dateprod) as 'annee'
FROM voiture
WHERE YEAR(dateprod) = 2000

-- Req 10: Afficher les voiture produites cette annee
SELECT* ,YEAR(dateprod) as 'annee'
FROM voiture
WHERE YEAR(dateprod) = YEAR(GETDATE())

-- Req 11: 

SELECT * FROM voiture
WHERE MONTH(dateprod) = MONTH(GETDATE())
AND YEAR(dateprod) = YEAR(GETDATE())

-- Req 12 : Afficher les voiture produites cette annee dernier
SELECT * FROM voiture
WHERE YEAR(dateprod) = YEAR(GETDATE())-1

PRINT GETDATE()
PRINT GETDATE()-1 -- l'annee dernier


-- Update---
UPDATE voiture 
set dateprod = '10/10/2010'
WHERE matricule = 10
