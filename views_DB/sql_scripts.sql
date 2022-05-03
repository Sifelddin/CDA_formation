--exercice 1 vues sur la base hotel
--1
create view v_hotels_stations as
select hot_nom,
    sta_nom
from hotel
    join station on sta _id = hot_sta_id;
--2
create view v_chambres_hotels as
select cha_id,
    cha_numero,
    hot_nom
from hotel
    join chambre on hot_id = cha_hot_id;
--3
create view v_reservations_clients as
select res_id,
    cli_nom
from client
    join reservation on cli_id = res_cli_id;
--4
create view v_chambres_hotels_stations as
select sta_nom,
    hot_nom,
    cha_id,
    cha_numero
from station
    join hotel on sta_id = hot_sta_id
    join chambre on hot_id = cha_hot_id;
--5
create view v_reservations_hotels_clients as
select res_id,
    cli_nom,
    hot_nom
from hotel
    join chambre on hot_id = cha_hot_id
    join reservation on cha_id = res_cha_id
    join client on cli_id = res_cli_id;
--Exercice 2 : vues sur la base papyrus
--1 v_GlobalCde
create view v_GlobalCde as
select codart as pro,
    sum(qtecde) as somme_qte,
    sum(priuni * qt ecde) as total
from ligcom
group by pro;
--2 v_VentesI100 
create view v_VentesI100 as
select *
from vente
where codart = 'I100';
--3
create view v_ventesI100Grobrigan as
select *
from v_VentesI100
where numfou = 00120;