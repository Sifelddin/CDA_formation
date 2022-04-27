USE test;

DROP TABLE IF EXISTS personne;
CREATE TABLE personne (per_nom varchar(50), per_prenom varchar(50), per_adress varchar(255) , per_num INT auto_increment NOT NULL , primary Key (per_num));

DROP TABLE IF EXISTS _group;
CREATE TABLE _group (gro_libelle varchar(50), gro_num INT auto_increment NOT NULL , PRIMARY KEY (gro_num));

CREATE TABLE group_personne (per_num INt , gro_num INT , FOREIGN KEY (per_num) REFERENCES personne(per_num) , FOREIGN KEY (gro_num) REFERENCES _group(gro_num));