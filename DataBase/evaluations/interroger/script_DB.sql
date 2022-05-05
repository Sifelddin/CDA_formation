--interroger la base de données
select
	CompanyName as Soci é t é,
	ContactName as contact,
	ContactTitle as Fonction,
	Phone as T é l é phone
from
	customers
where
	country = 'France';

--2

select
	ProductName,
	UnitPrice
from
	products
	join Suppliers on products.supplierID = Suppliers.SupplierID
where
	CompanyName = 'Exotic Liquids';

--3

select
	CompanyName as fournisseur,
	count(ProductID) as 'Nbre produits'
from
	suppliers
	join products on suppliers.supplierID = products.SupplierID
where
	country = 'France'
group by
	CompanyName
Order by
	`Nbre produits` desc;

--4

select
	CompanyName as Client,
	count(OrderID) as 'Nbre commandes'
from
	customers
	join orders on customers.CustomerID = orders.CustomerID
where
	country = 'France'
group by
	CompanyName
having
	count(OrderID) > 10;

--5

select
	CompanyName,
	sum(UnitPrice * Quantity) as CA,
	country as pays
from
	customers
	join orders on customers.customerID = orders.CustomerID
	join `order details` on orders.OrderID = `order details`.OrderID
group by
	CompanyName,
	country
having
	CA > 30000
order by
	CA desc;

--6

select
	distinct customers.country as pays
from
	suppliers
	join products on suppliers.SupplierID = products.SupplierID
	join `order details` on `order details`.productID = products.productID
	join orders on `order details`.OrderID = orders.OrderID
	join customers on orders.CustomerID = customers.CustomerID
where
	suppliers.CompanyName = 'Exotic Liquids'
order by
	pays asc;

--7

select
	sum(UnitPrice * Quantity - Discount) as `montant ventes 1997`
from
	`order details`
	join orders on `order details`.OrderID = orders.OrderID
where
	year(OrderDate) = '1997';

--8

select
	month(OrderDate) as `Mois 97`,
	sum(UnitPrice * Quantity - Discount) as `montant ventes 1997`
from
	`order details`
	join orders on `order details`.OrderID = orders.OrderID
where
	year(OrderDate) = '1997'
group by
	`Mois 97`;

--9

select
	max(OrderDate) as `Date de dernière commande`
from
	customers
	join orders on customers.CustomerID = orders.CustomerID
where
	customers.CompanyName = 'Du monde entier';

--10

select
	floor(avg(datediff(ShippedDate, OrderDate))) as `Délai moyen de livraison en jours`
from
	orders
where
	ShippedDate is not null;

--Procédures stockées
delimiter $

create procedure find_last_order(in client varchar(40)) 
begin 
select
	max(OrderDate) as `Date de dernière commande`
from
	customers
	join orders on customers.CustomerID = orders.CustomerID
where
	customers.CompanyName = client;
	end$
delimiter ;

delimiter $
create PROCEDURE avg_shipping_delay_days()
begin 
select
	floor(avg(datediff(ShippedDate, OrderDate))) as `Délai moyen de livraison en jours`
from
	orders
where
	ShippedDate is not null;
	end$
delimiter ;

--création d'un système qui vérifie l'insertion des produits selon les pays des client et fournisseurs
--create a procedure for insert order details
Delimiter $
create procedure insert_order_products(in order_id int , product_id int,UnitPrice decimal(10,4),Quantity smallint , discount double(8,0))
begin 
insert into `order details` (OrderID , ProductID , UnitPrice , Quantity, Discount) 
Values (order_id,product_id,UnitPrice,Quantity,discount);
end$
delimiter ;

Call insert_order_products(10254,14,18.6000,5,0);

--create procedure to find the country of the client and supplier according to the product id 
delimiter $
create procedure sup_cli_countries_by_product_order (in order_id int , product_id int)
begin
select customers.CustomerID , customers.country , suppliers.SupplierID , suppliers.country from customers join orders on customers.CustomerID = orders.CustomerID join `order details` on orders.OrderID = `order details`.orderID join products on `order details`.ProductID = products.ProductID join suppliers on products.SupplierID = suppliers.supplierID where orders.OrderID = order_id  AND `order details`.ProductID = product_id;
end$
delimiter ;
call sup_cli_countries_by_product_order (10254 , 24);
delimiter $
--procedure to find supplier country
create procedure sup_country_by_product_order ( product_id int)
begin
select country from suppliers join products on products.SupplierID = suppliers.SupplierID where ProductID = product_id;
end$
delimiter ;

call sup_country_by_product_order (24);
delimiter $
create procedure cli_country_by_product_order (in order_id int )
begin
select  country from customers join orders on customers.CustomerID = orders.CustomerID where orders.OrderID = order_id;
end$
delimiter ;

call cli_country_by_product_order(10254)

call sup_cli_countries_by_product_order (10254 , 24);


--create trigger for new products through checking he country of supplier and client
create trigger check_country before insert on `order details` for each row
begin 

declare cli_country varchar(40);
declare sup_country varchar(40);

set cli_country = (select country from customers join orders on customers.CustomerID = orders.CustomerID where orders.OrderID = new.OrderID);
set sup_country = (select country from suppliers join products on products.SupplierID = suppliers.SupplierID where ProductID = new.ProductID);

if cli_country != sup_country then 
 SIGNAL SQLSTATE '40000' SET MESSAGE_TEXT = 'Un problème est survenu. le client select un produit où son fournisseur a différent pays que le client  !';
 end if;
 end $






