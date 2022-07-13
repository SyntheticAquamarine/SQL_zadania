Use Northwind
Go
SELECT o.OrderID
, o.OrderDate 
, SUM(od.UnitPrice*od.Quantity) as worth
, o.ShippedDate
, LAG(od.UnitPrice*od.Quantity,1) OVER (ORDER BY od.UnitPrice*od.Quantity) AS 'wartosc poprzedniego'
, LEAD(o.ShippedDate,1) over (ORDER BY o.ShippedDate) AS 'data kolejnego'
from
Orders o
INNER JOIN
[Order Details] od on o.OrderID=od.OrderID
group by o.OrderID, o.OrderDate, o.ShippedDate, (od.UnitPrice*od.Quantity)
Order by o.ShippedDate