Use Northwind
go
Select [ProductID], [ProductName], [CategoryID], [UnitPrice],
min([UnitPrice]) Over (Partition by [CategoryID]) as 'minimalna cena dla kategorii',
max([UnitPrice]) Over (Partition by [CategoryID]) as 'maksymalna cena dla kategorii',
avg([UnitPrice]) Over (Partition by [CategoryID]) as 'srednia cena dla kategorii',
count(*) over (Partition by [CategoryID]) as 'liczba produktow w kategorii',
min([UnitPrice]) over() as 'ogolna cena minimalna',
max([UnitPrice]) over() as 'ogolna cena maksymalna',
avg([UnitPrice]) over() as 'srednia cena',
Count (*) over () as 'liczba produktow'
From [dbo].[Products]
group by [ProductID], [ProductName], [CategoryID], [UnitPrice]
order by 1