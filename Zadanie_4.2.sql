Use Northwind
Go

create function RoznicaDat(@data_1 datetime, @data_2 datetime)
	returns int
	BEGIN
		Return Datediff(day, @data_1, @data_2);
	End