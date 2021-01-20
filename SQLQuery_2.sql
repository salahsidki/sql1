CREATE DATABASE DBCommande
USE DBCommande
CREATE TABLE villes(
    idville int primary key identity(1,1), 
    ville VARCHAR(40)
)
SELECT * FROM villes

-- DROP TABLE villes


CREATE TABLE clients(
    idclient int identity(1,1) not NULL,
    nom varchar(40), 
    adresse varchar(50), 
    tel varchar(30), 
    email varchar(50) , 
    idville int ,
    CONSTRAINT pkClient PRIMARY KEY (idclient),
    CONSTRAINT fkVille FOREIGN KEY (idville) REFERENCES villes(idville)
)

--DROP table clients

CREATE TABLE commandes(
    Numcom int primary key IDENTITY(1,1) , 
    Datecom Date NOT NULL , 
    --idclient int foreign key references clients(idclient)
)

CREATE TABLE articles(
    idarticle int primary key IDENTITY(1,1) , 
    libarticle VARCHAR(40), 
    pu int , 
    qte_stock int 
)
-- DROP TABLE articles

CREATE TABLE details(

    numcom int NOT NULL ,
    idarticle int NOT NULL, 
    qtecom int,
    CONSTRAINT pkDetails PRIMARY KEY (numcom , idarticle),
    CONSTRAINT fkDetailsArticle FOREIGN KEY (idarticle) REFERENCES articles(idarticle),
    CONSTRAINT fkDetailCommande FOREIGN KEY (numcom) REFERENCES commandes(Numcom)

)

select * FROM details

-- Remplissage des table 
-- table villes
INSERT into villes VALUES('Beni mellal')
INSERT into villes VALUES('Casa')
INSERT into villes VALUES('Rabat')
INSERT into villes VALUES('Khmisat')
INSERT into villes VALUES('Tanger')
INSERT into villes VALUES('Fkih ben salah')

-- table clients
INSERT into clients VALUES('salah' , 'Rue n1 ', '0653014599','salah@gmail.com',1)
INSERT into clients VALUES('simo' , 'Rue n2 ', '0653014511','simo@gmail.com',2)
INSERT into clients VALUES('mahdi' , 'Rue n3 ', '0653014522','mahdi.com',3)
INSERT into clients VALUES('marwan' , 'Rue n4 ', '0653014533','marwan.com',4)
INSERT into clients VALUES('yassine' , 'Rue n5 ', '0653014544','yassine@gmail.com',5)








--DROP TABLE details



--select * FROM clients

-- declaration de variables , affectation et affichage
DECLARE @n1 INT , @n2 INT , @n3 INT 
SET @n1 = 10
SET @n2 = 20
SET @n3 = @n1 + @n2
PRINT 'le resultat est ' +CONVERT(VARCHAR , @n3)
PRINT 'le resultat est ' +cast(@n3 as VARCHAR)





