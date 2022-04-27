DROP USER IF EXISTS 'util1'@'%';
DROP USER IF EXISTS 'util2'@'%';
DROP USER IF EXISTS 'util3'@'%';

CREATE USER 'util3'@'%' IDENTIFIED BY 'util3';
CREATE USER 'util2'@'%' IDENTIFIED BY 'util2';
CREATE USER 'util1'@'%' IDENTIFIED BY 'util1';

GRANT ALL PRIVILEGES ON papyrus.* TO 'util1'@'%';
GRANT SELECT ON papyrus.* TO 'util2'@'%';
GRANT SELECT ON papyrus.fournis TO 'util3'@'%';
