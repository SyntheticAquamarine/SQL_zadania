use baza_ft
go

/*
alter database baza_ft
add filegroup fsGroup contains filestream;
go

alter database baza_ft
add file
  ( NAME = 'Plik_testowy', FILENAME = 'c:\Plik_testowy_fs'
   )
to filegroup fsGroup;
go
*/

/*
ALTER DATABASE baza_ft
SET FILESTREAM (NON_TRANSACTED_ACCESS = FULL, DIRECTORY_NAME = N'Data')

CREATE TABLE Tabela_testowa AS FileTable  
WITH  
(  
    FileTable_Directory = 'FileTableDirectory',  
    FileTable_Collate_Filename = database_default  
); 
*/


/*
UPDATE Tabela_testowa
SET name = 'Witaj_ponownie_swiecie.txt'  
WHERE stream_id = 'C77438DE-EEDD-EC11-8AFB-84A93842B5C7' 
*/

delete from Tabela_testowa  
WHERE stream_id = '18899EEB-EEDD-EC11-8AFB-84A93842B5C7' 


