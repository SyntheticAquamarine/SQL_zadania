USE Northwind
GO

WITH
customers_uk AS
(
SELECT CustomerID
FROM [dbo].[Customers]
WHERE Country = 'UK'
)
, customers_Sevilla AS
(
SELECT CustomerID
FROM [dbo].[Customers]
WHERE City = 'Sevilla'
)
, customers_vip AS
(
SELECT * FROM customers_uk
UNION ALL
SELECT * FROm customers_Sevilla
)
SELECT *
FROM [dbo].[Customers]
WHERE CustomerID IN (SELECT * FROM customers_vip)