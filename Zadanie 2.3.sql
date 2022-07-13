USE Northwind
GO

WITH
/*
PRODUCTS AS
(
SELECT * 
FROM [dbo].[Products]
WHERE CategoryID in (SELECT TOP 1 * 
FROM (SELECT CategoryID, COUNT(ProductID) AS Liczba from [dbo].[Products]
group by CategoryID
order by Liczba Desc)
)
*/
products AS
(
SELECT CategoryID, COUNT(ProductID) AS Liczba from [dbo].[Products]
group by CategoryID
--order by Liczba Desc
)
, products_top AS
(
SELECT top 1 *
FROM products
)
Select * from [dbo].[Products]
where ProductID in (Select * from products_top)