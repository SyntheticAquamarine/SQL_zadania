use Northwind
go

WITH SOURCE_DATA AS
(
SELECT p.ProductID, p.ProductName, p.UnitPrice, ISNULL(LAG(p.UnitPrice,1) OVER(Order by p.UnitPrice asc), 0) AS 'cena_produkt_pop'
	,LEAD(p.UnitPrice, 2) OVER(Order by p.UnitPrice asc) AS 'cena_produkt_2kol'
FROM Products p
--Order by p.UnitPrice asc
)
SELECT
--UnitPrice
--, cena_produkt_1
--, 
(UnitPrice - cena_produkt_pop) AS 'ró¿nica cen'
FROM source_data