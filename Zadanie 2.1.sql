Use Northwind
Go

With
Company_Name AS
(
SELECT CompanyName
from [dbo].[Customers]
)
, Orders_Placed_by_Customer AS
(
Select Orders.CustomerID, count(Orders.CustomerID) as liczba_zam
from [dbo].[Orders] INNER JOIN Customers on Orders.CustomerID = Customers.CustomerID
group by Orders.CustomerID
)
, Placed_Orders AS
(
SELECT count(Orders.CustomerID) AS NUMBER_OF_ORDERS
from [dbo].[Orders]
)
, Total AS
(
SELECT * FROM Company_Name
UNION ALL
SELECT * FROM Orders_Placed_by_Customer
UNION ALL
SELECT * FROM Placed_Orders
)
SELECT * from [dbo].[Orders] JOIN Customers on Orders.CustomerID = Customers.CustomerID
WHERE Orders.CustomerID IN (SELECT * From Orders_Placed_by_Customer)