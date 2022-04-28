DROP DATABASE IF EXISTS gescom_eval;
CREATE DATABASE gescom_eval;
USE gescom_eval;
CREATE TABLE client (
    cli_num INT UNSIGNED NOT NULL,
    cli_nom VARCHAR(50) NOT NULL,
    cli_adresse VARCHAR(50) NOT NULL,
    cli_tel VARCHAR(30) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;
CREATE TABLE commande (
    com_num INT UNSIGNED NOT NULL,
    cli_num INT UNSIGNED NOT NULL,
    com_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    com_obs VARCHAR(50)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;
CREATE TABLE produit (
    pro_num INT UNSIGNED NOT NULL,
    pro_libelle VARCHAR(50) NOT NULL,
    pro_description VARCHAR(50)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;
CREATE TABLE est_compose (
    com_num INT UNSIGNED NOT NULL,
    pro_num INT UNSIGNED NOT NULL,
    est_qte INT UNSIGNED NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;

ALTER TABLE client
ADD PRIMARY KEY (cli_num);

ALTER TABLE client
MODIFY cli_num int UNSIGNED NOT NULL AUTO_INCREMENT;
CREATE UNIQUE INDEX newClient ON client(cli_nom);

ALTER TABLE client
MODIFY cli_num int UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE commande
ADD PRIMARY KEY (com_num);

ALTER TABLE produit
ADD PRIMARY KEY (pro_num);

ALTER TABLE produit
MODIFY pro_num INT UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE commande
ADD FOREIGN KEY (cli_num) REFERENCES client(cli_num);
ALTER TABLE est_compose
ADD (
        FOREIGN KEY (com_num) REFERENCES commande(com_num),
        FOREIGN KEY (pro_num) REFERENCES produit(pro_num)
    );