--1
select entcom.numcom,
    fournis.numfou
FROM fournis
    join entcom on fournis.numfou = entcom.numfou
where fournis.numfou = 09120;
--2
select DISTINCT numfou
from entcom;
--3
select count(DISTINCT fournis.numfou) as n_fournis,
    count(numcom) as n_commandes
from fournis
    join entcom on entcom.numfou = fournis.numfou;
--4
select codart,
    libart,
    stkphy,
    stkale,
    qteann
from produit
where stkphy <= stkale
    AND qteann < 1000;
--5
select nomfou,
    substr(posfou, 1, 2) as departement
from fournis
where posfou REGEXP '75.*|78.*|92.*|77.*'
order by posfou ASC;
select nomfou,
    substr(posfou, 1, 2) as departement
from fournis
where posfou REGEXP '75.*|78.*|92.*|77.*'
order by posfou DESC;
--6
select numcom,
    datcom
from entcom
where month(datcom) IN (4, 3);
--7
select numcom,
    datcom,
    obscom
from entcom
where length(obscom) > 0;
--8
select DISTINCT numcom,
    sum(qtecde * priuni) as total
from ligcom
group by numcom
order by total desc;
--9
select numcom,
    sum(qtecde * priuni) as total
from ligcom
where qtecde < 1000
group by numcom
having total > 10000
order by total desc;
--10
select nomfou,
    numcom,
    datcom
from entcom
    join fournis on entcom.numfou = fournis.numfou;
--11
select produit.codart,
    entcom.numcom,
    nomfou,
    libart,
    (qtecde * priuni) total
from produit
    join ligcom on produit.cod art = ligcom.codart
    join entcom on ligcom.numcom = entcom.numcom
    join fournis on fournis.numfou = entcom.numfou
where instr(obscom, 'urgent') > 0;
--12
--1
select distinct nomfou
from fournis
    join entcom on fournis.numfou = entcom.numfou
    join ligcom on entcom.numcom = ligcom.numcom
where qteliv != 0;
--2
select distinct nomfou
from fournis
    join vente on fournis.numfou = vente.numfou
    join produit on vente.codart = produit.codart
    join ligcom on produit.codart = ligcom.codart
where qteliv != 0;