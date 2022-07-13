USE Northwind
GO

WITH
Employees_DATA AS
(
Select * FROM
[dbo].[Employees]
where BirthDate > (Select BirthDate FROM [dbo].[Employees] Where LastName = 'King')
)
, Youngsters AS
(
SELECT FirstName, LastName, BirthDate, ReportsTo
FROM Employees_DATA
)
SELECT * FROM Youngsters