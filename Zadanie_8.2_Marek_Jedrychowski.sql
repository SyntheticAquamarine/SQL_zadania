DECLARE @xmldata XML

SELECT @xmldata=BulkColumn
FROM 
OPENROWSET (BULK 'C:\Users\Marek\Desktop\1234567.xml',SINGLE_BLOB) as T1

--SELECT  
--	Tabliczka.element.value('Title','char(50)') as tytul
--FROM 
--	@xmldata.nodes ('/Catalog/Book') as Tabliczka(element)


SELECT  @xmldata.query('/Catalog/Book[Price="5.95"]') as Query


 SELECT  @xmldata.value('(/Catalog/Book[Price="5.95"])[1]',
                                                              'varchar(15)') as Value