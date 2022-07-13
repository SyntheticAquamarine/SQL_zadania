USE Northwind
GO

WITH
Employees_DATA AS
(
Select * FROM
[dbo].[Employees]
)
, KING AS
(
SELECT *
FROM [dbo].[Employees]
WHERE LastName = 'King'
)
, Youngsters AS
(
SELECT * FROM Employees_DATA
UNION ALL 
SELECT * FROM KING
WHERE Employees_DATA < KING.BirthDate
)
SELECT * FROM [dbo].[Customers]
WHERE CustomerID IN (SELECT * FROM Youngsters) 