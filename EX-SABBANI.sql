CREATE DATABASE DBCommande
------- Creation des table ------------
CREATE TABLE client(IDclt int primary key identity,Nom VARCHAR(40),Ville VARCHAR(40), DateNaiss DATE)
SELECT * FROM client
CREATE table produit(Code int primary key identity,Intitule VARCHAR(40), PrixUnitaire float , Stock int, DateProduction Date , NMoisValidte int)
CREATE TABLE Commande(Ref int primary key identity, IDclt int Foreign key REFERENCES client(IDclt),
                        codeP int Foreign key REFERENCES produit(Code),
                        quantite int,
                        DateCmd Date)
SELECT * FROM produit                        
DROP TABLE produit

--------- Remplisage-------------
INSERT into client VALUES('Mohamed')