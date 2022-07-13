Use Northwind
Go
Create trigger kontrola_tabel
on Database for drop_table
as
	print 'Nie usuwaj tej tabeli!'
	Rollback;