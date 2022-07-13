USE Northwind
GO
create PROCEDURE usuwanie
@LastName varchar(40)
AS
delete from CopyEmployees
where [LastName] = @LastName

Select [LastName] from CopyEmployees