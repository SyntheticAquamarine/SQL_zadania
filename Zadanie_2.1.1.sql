USE Northwind
GO

WITH
Customers_CHECK AS
(
SELECT CustomerID, ShipName
from [dbo].[Orders]
)
, Orders_Placed AS
(
Select count(CustomerID) AS Orders
from [dbo].[Orders]
group by CustomerID
)
, Orders_Total AS
(
SELECT count(CustomerID) AS NUMBER_OF_ORDERS
from [dbo].[Orders]
)
, Total AS
(
SELECT * from Customers_CHECK
UNION ALL
SELECT * from Orders_Placed
Union ALL
SELECT * FROM Orders_Total
)
SELECT * FROM [dbo].[Orders]
Where CustomerID in (Select * from Total)
