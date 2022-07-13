exec sp_configure 'filestream access level' , 2
reconfigure

create database baza_ft

alter database baza_ft add filegroup fg_ft contains filestream

alter database baza_ft add file
(name='tbl' , filename = 'c:\baza_ft_file')
to filegroup fg_ft

alter database baza_ft set filestream (directory_name='nasza_baza_ft')
alter database baza_ft set filestream (non_transacted_access= full)

use baza_ft
create table tabela_ft as filetable
with (filetable_directory = 'nasza_tabela_ft')

select * from tabela_ft

update tabela_ft set is_readonly=1 where name = 'Nowy Microsoft Access Database.accdb'


update tabela_ft set is_hidden=0 where name = 'Nowy Microsoft Access Database.accdb'


update tabela_ft set name = 'baza.accdb' where name = 'Nowy Microsoft Access Database.accdb'

update tabela_ft set file_type='xls' where name = 'baza.accdb' ---nie dzia³a, bo jest computed

insert into tabela_ft (name,file_stream) values ('plik.txt',cast('czesc' as varbinary(max)))

declare @image varbinary(max)
select @image = cast (bulkcolumn as varbinary(max)) from
openrowset (bulk 'C:\Users\janja\OneDrive\Obrazy\pic.bmp', single_blob) as a
insert into tabela_ft (name, file_stream)
values ('obrazek.bmp',@image)
delete from tabela_ft where name = 'jajko.png'
update tabela_ft set file_stream = cast ('obrazek' as varchar(max))
where name='obrazek.bmp'

insert into tabela_ft (name,is_directory) values ('nasz_katalog',1)