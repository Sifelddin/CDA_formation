
--hotel database
--1
create trigger modif_reservation before update on reservation
for each row
begin
signal sqlstate '40000' set message_text = "you can not modify reservation!";

end;
--2

create trigger insert_reservation 
before insert on reservation 
for each row 
begin 
    declare tot int;
    set tot = (select count(res_id) from reservation join chambre on res_cha_id = cha_id join
    hotel on hot_id = cha_hot_id where
    hot_id = (select hot_id from hotel join chambre on hot_id = cha_hot_id join reservation on res_cha_id = cha_id where res_id = new.res_id));
    if tot > 10 then
    SIGNAL SQLSTATE '40000' SET MESSAGE_TEXT = 'there are 10 reservations already !';
    end if;
 end;
--3
 create trigger insert_reservation2 before insert on reservation for each row 
 begin
 declare tot_res int;
 set tot_res = ( select count(res_id) from reservation join client on res_cli_id = cli_id
 where cli_id = (select res_cli_id from reservartion where new.res_id));
 if tot_res > 3 then 
  SIGNAL SQLSTATE '40000' SET MESSAGE_TEXT = 'there are 3 or more reservations already for this client !';
end if;
end$
--4
delimiter $
create trigger insert_chambre before insert on chambre for each row
begin

declare tot_capacite int;

set tot_capacite =(select sum(cha_capacite) from hotel join chambre on cha_hot_id = hot_id where hot_id = (select cha_hot_id from chambre where new.cha_id));
    if tot_capacite > 50 then 
        SIGNAL SQLSTATE '40000' SET MESSAGE_TEXT = 'there are 50 or more capacites already for this hotel !';
    end if;
end$
delimiter ;


CREATE TRIGGER maj_total AFTER INSERT ON lignedecommande
    FOR EACH ROW
    BEGIN
        DECLARE id_c INT;
        DECLARE tot DOUBLE;
        SET id_c = NEW.id_commande;
        SET tot = (SELECT sum(prix*quantite) FROM lignedecommande WHERE id_commande=id_c);
        UPDATE commande SET total=tot WHERE id=id_c;
END;