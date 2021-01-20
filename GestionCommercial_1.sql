CREATE DATABASE GestionCommercial
USE GestionCommercial
CREATE table client(
    idClient int PRIMARY KEY IDENTITY(1,1),
    nom VARCHAR(40),
    prenom VARCHAR(40),
    tel VARCHAR(40),
    email VARCHAR(200)
)

SELECT * FROM client

-- ajouter le champe adresse dans la table client
ALTER TABLE client ADD adresse VARCHAR(100)

-- modifier le champe adresse dans la table client 
ALTER table client ALTER COLUMN adresse VARCHAR(160)

-- supprimer le champe adresse dans la table client 
ALTER table client DROP COLUMN adresse

-- supprimer la table client 
DROP table client
-- creation de table Produit 
CREATE table Produit( 
    refProduit VARCHAR(50) primary key, 
    Designation VARCHAR(255) , 
    Prix money
    )

DROP table Produit    


CREATE table Produit( 
    refProduit VARCHAR(50), 
    Designation VARCHAR(255) , 
    Prix money
    )

SELECT * FROM Produit

-- ajouter not null au champs refProduit
ALTER TABLE Produit ALTER COLUMN refProduit VARCHAR(50) NOT NULL

-- ajouter la cle primaire
alter table Produit ADD CONSTRAINT pkRef PRIMARY KEY (refProduit)





-- Creation primary key methode 2 

CREATE table client(
    idClient int IDENTITY(1,1),
    nom VARCHAR(40),
    prenom VARCHAR(40),
    tel VARCHAR(40),
    email VARCHAR(200),
    CONSTRAINT pkClient PRIMARY KEY (idClient)
)

-- supprimer le cle primaire dans la table client 
alter table client DROP CONSTRAINT pkClient


-- creer une cle primaire sur une table existance 
ALTER TABLE client add CONSTRAINT pkClient PRIMARY KEY (idClient)


-- ajouter une table aver une cle primaire 


-- methode 1
CREATE TABLE commande(
    idCommande int IDENTITY(1,1),
    idClient int FOREIGN key REFERENCES client(idClient),
    dateCommande DATE NOT NULL,
    CONSTRAINT pkCommande PRIMARY KEY (idCommande),
    
)

DROP table commande

-- methode 2
CREATE TABLE commande(
    idCommande int IDENTITY(1,1),
    idClient int,
    dateCommande DATE NOT NULL,
    CONSTRAINT pkCommande PRIMARY KEY (idCommande),
    CONSTRAINT fkCommandeClient FOREIGN KEY (idClient) REFERENCES client(idClient)
)

DROP table commande

-- methode 3 
CREATE table commande(
    idCommande int IDENTITY(1,1),
    idClient int,
    dateCommande DATE NOT NULL,
    CONSTRAINT pkCommande PRIMARY KEY (idCommande),
    
)
ALTER TABLE commande ADD
CONSTRAINT fkCommandeClient FOREIGN KEY (idClient) REFERENCES client(idClient)


SELECT * FROM commande



