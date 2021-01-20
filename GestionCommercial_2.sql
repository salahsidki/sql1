CREATE DATABASE GestionCommercial_2
USE GestionCommercial_2

-- la table Client

CREATE table client(
    idClient int NOT NULL,
    nom VARCHAR(40),
    prenom VARCHAR(40),
    tel VARCHAR(40),
    email VARCHAR(200),
    CONSTRAINT pkClient PRIMARY KEY (idClient)
)

SELECT * FROM client

-- la table Produit


CREATE table Produit( 
    refProduit VARCHAR(50) NOT NULL, 
    Designation VARCHAR(255), 
    Prix money,
    CONSTRAINT pkProduit PRIMARY KEY (refProduit)
)

SELECT * FROM Produit
-- la table Commande

CREATE TABLE commande(
    idCommande int IDENTITY(1,1),
    idClient int NOT NULL,
    dateCommande DATE NOT NULL,
    CONSTRAINT pkCommande PRIMARY KEY (idCommande),
    CONSTRAINT fkCommande FOREIGN KEY (idClient) REFERENCES client(idClient)
    
)

SELECT * FROM commande

-- la tThe able ligne

CREATE table ligne(
    idCommande INT NOT NULL,
    refProduit VARCHAR(50) NOT NULL,
    quantite INT,
    prixVente money,
    CONSTRAINT pkLigne PRIMARY KEY (idCommande, refProduit),
    CONSTRAINT fkLigneCommande FOREIGN KEY (idCommande) REFERENCES commande(idCommande),
    CONSTRAINT fkLigneProduit FOREIGN KEY (refProduit) REFERENCES Produit(refProduit)

)

SELECT * FROM ligne



