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

--declencheurs


DELIMITER $
create trigger insert_orderDate after insert on orders for each row
    -> begin
    -> select
    ->  max(OrderDate) as `Date de dernière commande`
    -> from
    ->  customers
    ->  join orders on customers.CustomerID = orders.CustomerID
    -> where
    ->  customers.CompanyName = 'Du monde entier' AND OrderDate = new.OrderDate;
    end$
    DELIMITER ;

