CREATE DATABASE DBCommande_2
USE DBCommande_2
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


SELECT * FROM clients

--DROP table clients

CREATE TABLE commandes(
    Numcom int primary key IDENTITY(1,1) , 
    Datecom Date NOT NULL , 
    idclient INT
    --idclient int foreign key references clients(idclient)
)

ALTER table commandes ADD idclient INT FOREIGN KEY REFERENCES clients(idclient)

SELECT * FROM commandes
---DROP TABLE commandes

CREATE TABLE articles(
    idarticle int primary key IDENTITY(1,1) , 
    libarticle VARCHAR(40), 
    pu money , 
    qte_stock int ,
    qte_max INT
)

ALTER TABLE articles ADD qte_max INT
ALTER table articles ALTER COLUMN pu money



-- DROP TABLE articles
SELECT * FROM articles

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
INSERT into villes VALUES('casa')
INSERT into villes VALUES('Fkih ben salah')

-- table clients
INSERT into clients VALUES('salah' , 'Rue n1 ', '0653014599','salah@gmail.com',1)
INSERT into clients VALUES('simo' , 'Rue n2 ', '0653014599','simo@gmail.com',2)
INSERT into clients VALUES('mahdi' , 'Rue n3 ', '0653014522','mahdi.com',3)
INSERT into clients VALUES('marwan' , 'Rue n4 ', '0653014533','marwan.com',4)
INSERT into clients VALUES('yassine' , 'Rue n5 ', '0653014544','yassine@gmail.com',5)


SELECT * FROM clients

-- table commande

INSERT into commandes VALUES('2000-01-01',1)
INSERT into commandes VALUES('2001-01-02',2)
INSERT into commandes VALUES('2002-01-02',3)
INSERT into commandes VALUES('2001-01-03',4)
INSERT into commandes VALUES('2002-01-01',5)


-- table articles

insert into articles VALUES('article 01', 200.00 ,20,200 )
insert into articles VALUES('article 02', 300.00 ,10,200 )
insert into articles VALUES('article 03', 400.00 ,150,200 )
insert into articles VALUES('article 02', 500.00 ,100,200 )
insert into articles VALUES('article 04', 600.00 ,30,200 )





--DROP TABLE details



--select * FROM clients

-- declaration de variables , affectation et affichage------------------------------
DECLARE @n1 INT , @n2 INT , @n3 INT 
SET @n1 = 10
SET @n2 = 20
SET @n3 = @n1 + @n2
PRINT 'le resultat est ' +CONVERT(VARCHAR , @n3)
PRINT 'le resultat est ' +cast(@n3 as VARCHAR)


DECLARE @nbClient INT
SELECT @nbClient= COUNT(*) FROM clients
PRINT 'le nombre de client est ='+cast(@nbClient as varchar)


-- les structures conditionnelles
DECLARE @a int , @b int, @r int, @opp VARCHAR(50)
SELECT @a = 10 , @b = 20
IF(@a <@b)
    BEGIN
        set @r = @b- @a
        SET @opp = 'soustraction'
    END    

ELSE
    BEGIN
        SET @r = @a + @b
        SET @opp = 'additions'
    END
    

PRINT 'le resultat est ' +cast(@r as varchar)+' l''operation est'+@opp



-------------------------------------------------------------------------------------------- :)
SELECT * from articles
DECLARE @id int , @qte int , @qtestock int , @qtemax INT
SET @id = 3
SET @qte = 40
IF exists(select * from articles where idarticle = @id )
    BEGIN
        SELECT @qtemax = qte_max , @qtestock = qte_stock from articles WHERE idarticle = @id
        IF((@qte +@qtestock) < @qtemax)
            BEGIN
                UPDATE articles
                SET qte_stock = @qte + @qtestock
                where idarticle = @id
                PRINT 'le stock de l''article '+CAST(@id as VARCHAR )+'est mise a jour correctement'
            END  
        ELSE
            PRINT 'impossible de mettre a jour le stock de l''artcile '+cast(@id as VARCHAR)

    END

ELSE
PRINT 'artcile '+CAST(@id as varchar)+'introuvale.'
PRINT '-------------------------------------------------------------------'

SELECT * from articles



--- l'instruction case ---------------------------------------------
SELECT * from articles
SELECT idarticle, libarticle,pu,'Taux de reduction'=
CASE
WHEN pu<100 then '0%'
when pu>=100 and pu< 200 then '5%'
when pu>=200 and pu<300 then '7%'
when pu>=300 and pu<400 then '8%'
else '10%'
end
FROM articles

---------------
SELECT idarticle, libarticle,pu,'Nouveau pu'=
CASE
WHEN pu<100 then cast(pu as money)
when pu>=100 and pu< 200 then convert(money,pu-pu*0.05)
when pu>=200 and pu<300 then cast(pu-pu*0.07 as money)
when pu>=300 and pu<400 then cast(pu-pu*0.08 as money)
else cast(pu-pu*0.10  AS money)
end
FROM articles

----------------
SELECT idarticle, libarticle,pu,'Taux de reduction'=
CASE
WHEN pu<100 then '0%'
when pu>=100 and pu< 200 then '5%'
when pu>=200 and pu<300 then '7%'
when pu>=300 and pu<400 then '8%'
else '10%'
end
,'Nouveau pu'=
CASE
WHEN pu<100 then cast(pu as money)
when pu>=100 and pu< 200 then convert(money,pu-pu*0.05)
when pu>=200 and pu<300 then cast(pu-pu*0.07 as money)
when pu>=300 and pu<400 then cast(pu-pu*0.08 as money)
else cast(pu-pu*0.10  AS money)
end
FROM articles

--------------------------------------------------------------------------------

---- la structure iterative (while)
SELECT com.idclient,COUNT(Numcom) as [nbr Commande]
FROM clients c,commandes com
WHERE c.idclient = com.idclient
GROUP by com.idclient


---- commant utitliser la fonction row_number --------------
SELECT ROW_NUMBER() OVER (order by com.idclient) as id,
com.idclient,COUNT(Numcom) as [nbr Commande]
FROM clients c,commandes com
WHERE c.idclient = com.idclient
GROUP by com.idclient

--- cree une vue ------------
CREATE VIEW my_commande as (
SELECT ROW_NUMBER() OVER (order by com.idclient) as id,
com.idclient,COUNT(Numcom) as [nbr Commande]
FROM clients c,commandes com
WHERE c.idclient = com.idclient
GROUP by com.idclient
)

SELECT * FROM my_commande



---- les curseurs -----------------------------------------------------
-- un curseur est un objet qui nous permet d'executer un traitement sur un ensemble d'enregistrements
select * from clients
DECLARE @idclient int ,@nom VARCHAR(50)
--- Declaration de mon curseur 
DECLARE MonCurseur CURSOR FOR
SELECT idclient , nom from clients
-- ouvrir moncurseur 
OPEN MonCurseur 
-- Permet d'extraire une ligne de curseur 
FETCH MonCurseur into @idclient , @nom

-- trois etats 0,-1 ,-2
WHILE @@FETCH_STATUS = 0
BEGIN
PRINT 'le code client est '+CONVERT(VARCHAR ,@idclient) +'Nom :'+@nom
FETCH MonCurseur into @idclient,@nom 
END

-- fermeture de MonCurseur
CLOSE MonCurseur

-- lebiration de la memoire 
DEALLOCATE MonCurseur



