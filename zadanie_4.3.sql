Use Northwind
Go
create trigger Kontrola_del on [dbo].[CopyEmployees] for delete as
if(select count(*) from deleted)>1 
begin print 'Z tabeli employees mozna usuwaæ maksymalnie po jednym wierszu na raz' rollback end
go
