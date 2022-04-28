--8
SELECT nom,
    prenom
from employe
where prenom > nom;
--9
SELECT nom,
    salaire,
    nodep
from employe
where titre = 'Représentant'
    AND nodep = 35
    AND salaire > 20000;
--10
SELECT nom,
    titre,
    salaire
from employe
where titre = 'Représentant'
    OR titre = 'Président';
--11
SELECT nom,
    titre,
    nodep,
    salaire
from employe
where nodep = 34
    AND (
        titre = 'Représentant'
        OR titre = 'Secrétaire'
    );
--12
SELECT nom,
    titre,
    nodep,
    salaire
from employe
where (
        titre = "Représentant"
        OR titre = "Secrétaire"
    )
    AND nodep = 34;
--13
SELECT nom,
    salaire
from employe
where 30000 > salaire
    AND salaire > 20000;
--15
SELECT nom
from employe
where nom like 'h%';
--16
SELECT nom
from employe
where nom like '%n';
--17
SELECT nom
from employe
where nom like '__u%';
--18
SELECT salaire,
    nom
from employe
where nodep = 41
ORDER BY salaire ASC;
--19
SELECT salaire,
    nom
from employe
where nodep = 41
ORDER BY salaire DESC;
--20
SELECT titre,
    salaire,
    nom
from employe
ORDER BY titre ASC,
    salaire DESC;
--21
SELECT tauxcom,
    salaire,
    nom
from employe
order by tauxcom ASC;
--22
SELECT nom,
    salaire,
    tauxcom,
    titre
from employe
where tauxcom is null;
--23
SELECT nom,
    salaire,
    tauxcom,
    titre
from employe
where tauxcom is NOT null;
--24
SELECT nom,
    salaire,
    tauxcom,
    titre
from employe
where tauxcom < 15;
--25
SELECT nom,
    salaire,
    tauxcom,
    titre
from employe
where tauxcom > 15;
--26
SELECT nom,
    salaire,
    tauxcom,
(salaire * tauxcom) AS commission
from employe
where tauxcom is not null;
--27
SELECT nom,
    salaire,
    tauxcom,
(salaire * tauxcom) AS commission
from employe
where tauxcom is not null
ORDER BY tauxcom DESC;
--28
SELECT concat(nom, prenom) as nom_prenom
from employe;
--29
select nom,
    SUBSTRING(nom, 1, 5) as sub_nom
from employe;
--30
select nom,
    LOCATE('r', nom) as r_location
from employe;
--31
select nom,
    UPPER(nom),
    LOWER(nom)
from employe
where nom = "Vrante";
--32
select nom,
    LENGTH(nom) as len_nom
from employe;