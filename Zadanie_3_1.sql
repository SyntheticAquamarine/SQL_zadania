Use Northwind
Go
SELECT o.OrderID
, o.OrderDate 
, SUM(od.UnitPrice*od.Quantity) as worth
, (e.FirstName + ' ' + e.LastName) as pracownik
, DENSE_RANK() OVER(ORDER BY od.UnitPrice*od.Quantity asc) as 'ranga'
FROM ORDERS o
INNER JOIN 
Employees e on o.EmployeeID=e.EmployeeID
INNER JOIN
[Order Details] od on o.OrderID=od.OrderID
group by o.OrderID, o.OrderDate, (e.FirstName + ' ' + e.LastName), od.UnitPrice*od.Quantity