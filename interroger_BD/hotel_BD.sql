--1
SELECT hot_nom,
    hot_ville
from hotel;
--2
SELECT cli_ville
from client
where cli_nom = 'White';
--3
select sta_nom,
    sta_altitude
from station
where sta_altitude < 1000;
--4
SELECT cha_numero,
    cha_capacite
from chambre
where cha_capacite > 1;
--5
select cli_nom,
    cli_ville
from client
where cli_ville != "Londre";
--6
select hot_nom,
    hot_ville,
    hot_categorie
from hotel
where hot_ville = "Bretou"
    AND hot_categorie > 3;
--7 
SELECT sta_nom,
    hot_nom,
    hot_categorie,
    hot_ville
from station
    join hotel on sta_id = hot_sta_id;
--8
select hot_nom,
    hot_categorie,
    hot_ville,
    cha_numero
from hotel
    join chambre on hot_id = cha_hot_id;
--9
select hot_nom,
    hot_categorie,
    hot_ville,
    cha_numero,
    cha_capacite
from hotel
    join chambre on hot_id = cha_hot_id
where cha_capacite > 1
    AND hot_ville = "Bretou";
--10
select cli_nom,
    hot_nom,
    res_date
from hotel
    join chambre on hot_id = cha_hot_id
    join reservation on cha_id = res_cha_id
    join client on res_cli_id = cli_id;
--11
select sta_nom,
    hot_nom,
    cha_numero,
    cha_capacite
from station
    join hotel on sta_id = hot_sta_id
    join chambre on hot_id = cha_hot_id;
--12
select cli_nom,
    hot_nom,
    res_date_debut,
    datediff(res_date_fin, res_date_debut) as duree_jours
from hotel
    join chambre on hot_id = cha_hot_id
    join reservation on cha_id = res_cha_id
    join client on cli_id = res_cli_id;
--13
select count(hot_id) as nombre_hotel,
    sta_nom
from station
    join hotel on hot_sta_id = sta_id
group by sta_nom;
--14
select count(cha_id) as nombre_chambre,
    sta_nom
from station
    join hotel on sta_id = hot_sta_id
    join chambre on hot_id = cha_hot_id
group by sta_nom;
--15
select count(cha_id) as nombre_chambre,
    sta_nom
from station
    join hotel on sta_id = hot_sta_id
    join chambre on hot_id = cha_hot_id
where cha_capacite > 1
group by sta_nom;
--16
select distinct hot_nom,
    cli_nom
from hotel
    join chambre on hot_id = cha_hot_id
    join reservation on cha_id = res_cha_id
    join client on cli_id = res_cli_id
where cli_nom = "squire";
--17
select sta_nom,
    avg(datediff(res_date_fin, res_date_debut)) as duree_moyenne
from station
    join hotel on sta_id = hot_sta_id
    join chambre on hot_id = cha_hot_id
    join reservation on cha_id = res_cha_id
group by sta_nom;