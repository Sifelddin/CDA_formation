--Exercice 1 création d'une procédure stockée sans paramètre
delimiter.create
OR replace procedure Lst_fournis() begin
select distinct numfou
from entcom;
end.delimiter;
call Lst_fournis;
------
--Exercice 2 : création d'une procédure stockée avec un paramètre en entrée
create procedure lst_commandes(in checkStr varchar(50)) begin
select *
from entcom
where instr(obscom, checkStr) > 0;
end.delimiter;
call lst_commandes('urgent');
------
--Exercice 3 : création d'une procédure stockée avec plusieurs paramètres
DELIMITER$
CREATE PROCEDURE CA_fourni(in nfou int, in addate date) BEGIN
SELECT nomfou,
    sum(qte1*(prix1 + prix1 * 0.2) + qte2 *(prix2 + prix2 * 0.2) + qte3 *(prix3 + prix3 * 0.2)) as CA,
    datcom
from vente
    join fournis on vente.numfou = fournis.numfou
    join entcom on fournis.numfou = entcom.numfou
where fournis.numfou = nfou
    AND date(datcom) = date(addate)
group by nomfou,
    datcom;
end$
DELIMITER;