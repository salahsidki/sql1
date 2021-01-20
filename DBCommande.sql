create database DBCommande 
use DBCommande
create table Produit(numprd int primary key identity,
					 nom varchar(40),
					 PrixU float,
					 Stock int,
					 datefab date,
					 njourvalidite int)
create table Client(numclt int primary key identity,
					nom varchar(40),
					datenais date)
create table Commande(numcmd int primary key identity,
					numclt int foreign key references Client(numclt),
					numprd int foreign key references Produit(numprd),
					datecmd date)
insert into Produit(nom) values('Clavier'),('PC HP'),('Ecran'),('Stylo')
insert into Client(nom) values('Amine'),('Reda'),('Fatima'),('Rachida')
insert into Commande(numclt,numprd) values(5,1),(5,2),(5,1),(5,1),(6,2)

select * from Client
select * from Produit
select * from Commande

select distinct numclt
from Commande
-------------------------------------------------------------------------
-- declare @numclient int
-- -- Declaration Cursseur
--declare Curclient cursor for select distinct numclt from Commande

---- Ouverture
--Open Curclient
--fetch Curclient into @numclient
--print 'Etape 1 : @numclient = ' + convert(varchar,@numclient)

--fetch Curclient into @numclient
--print 'Etape 2 : @numclient = ' + convert(varchar,@numclient)
-------------------------------------------------------------------
---- Exemple 1 :---------------------------
---- Version 1 ---------------------------
-----------------------------------------------------------------------
-- declare @numclient int
-- declare @N int
-- declare @nomclient varchar(50)
-- -- Declaration Cursseur
--declare Curclient cursor for select distinct Commande.numclt , Client.nom from Commande inner join Client on Commande.numclt = Client.numclt
---- Ouverture
--Open Curclient
--fetch Curclient into @numclient,@nomclient
--while(@@FETCH_STATUS = 0)
--begin
--	select @N=count(*)  from Commande where numclt = @numclient
--	print 'Le N° Client ' + convert(varchar,@numclient) + ', Nom : '+ @nomclient+' a passe ' + convert(varchar,@N) + ' Commandes'
--	fetch Curclient into @numclient,@nomclient -- Passer la valeur suivante
--END
--close Curclient -- fermer le cursseur
--Deallocate Curclient -- Liberer l'espace mémoire loué par le Cursseur
--------------------------------------------------------------------------
---- Version 1 ---------------------------
-----------------------------------------------------------------------
--- Exemple 1 : Version 2 -----------------------------
 declare @numclient int
 declare @N int
 declare @nombrecommande int
 declare @nomclient varchar(50)
 -- Declaration Cursseur
declare Curclient cursor for select Commande.numclt , Client.nom , count(*)
						 from Commande inner join Client on Commande.numclt = Client.numclt
						 group by Commande.numclt , Client.nom
-- Ouverture
Open Curclient
fetch Curclient into @numclient,@nomclient,@nombrecommande
while(@@FETCH_STATUS = 0)
begin
	print 'Le N° Client ' + convert(varchar,@numclient) + ', Nom : '+ @nomclient+' a passe ' + convert(varchar,@nombrecommande) + ' Commandes'
	fetch Curclient into @numclient,@nomclient,@nombrecommande -- Passer la valeur suivante
END
close Curclient -- fermer le cursseur
Deallocate Curclient -- Liberer l'espace mémoire loué par le Cursseur


------------------------------------------------------------------------
-- le nombre des clients
declare @nclt int
select @nclt=count(*) from Client
select @nclt as 'Nombre des clients'
print 'Nombre des clients est ' + convert(varchar,@nclt)
------------------------------------------------------------------------
declare @N int

select @N=count(*) from Client
print 'Nombre des clients est ' + convert(varchar,@N)

select @N=count(*) from Produit
print 'Nombre des Produit est ' + convert(varchar,@N)

select @N=count(*) from Commande
print 'Nombre des Commande est ' + convert(varchar,@N)
------------------------------------------------------------------------
select getdate()
select getdate() as 'Aujourd''hui'
print 'Bonjour'
print getdate()
print 'Au Revoir'
------------------------------------------------------------------
print convert(varchar,getdate()) + ' est Date d Aujourd''hui ****'
DECLARE @D DATE
SET @D = GETDATE()
print '////Date d''aujourd''hui est : ' + convert(varchar,@D)
------------------------------------------------------------------------
declare @maxq int,@minq int,@moyq float
select @maxq=max(quantite),@minq=min(quantite),@moyq=Avg(quantite) from Commande
print 'La quantite Maximale est ' + convert(varchar,@maxq)
print 'La quantite Minimale est ' + convert(varchar,@minq)
print 'La quantite Moyenne est ' + convert(varchar,@moyq)
------------------------------------------------------------------------
-- le nombre des commandes 
declare @n int,@nprd int
select @nprd = 1 -- ou bien    set @nprd = 1
select @n=count(*) from Commande where numprd = @nprd
print 'Nombre des commandes du produit N° ' + convert(varchar,@nprd) + ' est : ' + convert(varchar,@n)
------------------------------------------------------------------------
select count(*) from Commande where numprd = 1

Alter table Commande
Add quantite int

update Commande
set quantite = 20
where numcmd not in (1,2,3)

select * from Commande
---------------------------------------------------------------------------
-- Les Cursseurs !!!!!!!!! Travail et Recherche pour la prochaine fois
declare @numclt int,@ncommande int
set @numclt = 1 -- ou bien select @numclt = 1
select @ncommande=count(*) from Commande where numclt = @numclt
--select @ncommande as 'Nombre des commandes'
print 'le Client N° ' + convert(varchar,@numclt) + ' a passé ' + convert(varchar,@ncommande) + ' Commandes'
----------------------------------------------------------------------------
declare @numclt int,@ncommande int,@nom varchar(50)
set @numclt = 1 -- ou bien select @numclt = 1

select @ncommande=count(*) 
from Commande
where numclt = @numclt

select @nom=nom
from Client
where numclt = @numclt

print 'le Client N° ' + convert(varchar,@numclt) + ', Nommé ' +@nom+' a passé ' + convert(varchar,@ncommande) + ' Commandes'
--------------------------------------------------------------------------------------------
select * from Client
select * from Produit
select * from Commande
--------------------------------------------------------------------------
------------------ Exemple 2 : Version 1 -----------------
declare @numeroclient int, @nombrecmd int
declare curclient cursor for	select numclt,count(*)
								from Commande
								group by numclt
open curclient
fetch curclient into @numeroclient,@nombrecmd
while(@@FETCH_STATUS = 0)
Begin
-- Traitement
print 'Le client N° '+ convert(varchar,@numeroclient) + ' a passé ' + cast(@nombrecmd as varchar) + ' commandes'
fetch curclient into @numeroclient,@nombrecmd -- Passer à la ligne suivante
End
close curclient -- fermeture du cursseur
Deallocate curclient -- Liberation du cursseur
--------------------------------------------------------------------------
------------------ Exemple 2 : Version 2 -----------------
declare @A int,@N int
declare Cur1 cursor for select numclt from Client
open Cur1
fetch Cur1 into @A -- Capter la première ligne
while(@@FETCH_STATUS = 0)
Begin
	-- Traitement 
	select @N = count(*) from Commande where numclt =  @A
	print 'Le client N° ' + cast(@A as varchar) + 'A passe '+ cast(@N as varchar) + ' Commandes'
	fetch Cur1 into @A
End
close Cur1
Deallocate Cur1
--------------------------------------------------------------------------
--------------------------------------------------------------------------
