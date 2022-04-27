DROP DATABASE IF EXISTS hotel;
CREATE DATABASE hotel;

 USE hotel;

DROP TABLE IF EXISTS station;
CREATE TABLE station( num_station INT NOT NULL, nom_station varchar(255));

DROP TABLE IF EXISTS client;
CREATE TABLE client (num_client INT NOT NULL, nom_client varchar(255), prenom_client varchar(255), adresse_client varchar(255));

DROP TABLE IF EXISTS hotel;
CREATE TABLE hotel (num_hotel INT NOT NULL, num_station INT , capacite_hotel INT , categorie_hotel varchar(255), nom_hotel varchar(255), adresse_hotel varchar(255));

DROP TABLE IF EXISTS chambre;
CREATE TABLE chambre (num_chambre INT NOT NULL, num_hotel INT , capacite_chambre INT , degre_confort_chambre INT , exposition_chambre varchar(255) , type_chambre varchar(255));

DROP TABLE IF EXISTS resarvation ;
CREATE TABLE reservation (num_chambre INT NOT NULL, num_client INT NOT NULL, data_debut_res DATE , date_fin_res DATE, date_reservation DATE , montant_arrhes_res DECIMAL(5, 2), prix_total_res INT); 

ALTER TABLE station ADD (PRIMARY KEY(num_station)); 
ALTER TABLE station MODIFY num_station INT auto_increment NOT NULL ;

ALTER TABLE client ADD (PRIMARY KEY(num_client));
ALTER TABLE client MODIFY num_client INT auto_increment NOT NULL ;

ALTER TABLE hotel ADD (FOREIGN KEY(num_station) REFERENCES station(num_station) , PRIMARY KEY(num_hotel));
ALTER TABLE hotel MODIFY num_hotel INT auto_increment NOT NULL ;

ALTER TABLE chambre ADD(FOREIGN KEY(num_hotel) REFERENCES hotel(num_hotel), PRIMARY KEY(num_chambre));
ALTER TABLE chambre MODIFY num_chambre INT auto_increment NOT NULL ;

ALTER TABLE reservation ADD (FOREIGN KEY(num_chambre) REFERENCES chambre(num_chambre), FOREIGN KEY(num_client) REFERENCES client(num_client));




