USE TEMPDB
GO

CREATE TABLE [dbo].[Catalog](
	[Author] [char](50) NOT NULL,
	[Title] [char](50) NOT NULL,
	[Genre] [char](50) NOT NULL,
	[Price] [smallmoney] NOT NULL,
	[PublishDate] [date] NOT NULL,
	[Description] [char](50) NOT NULL,

	 CONSTRAINT [data_ksiazki] PRIMARY KEY CLUSTERED 
	(
		[PublishDate] ASC
	)
)

DECLARE @xmldata XML

SELECT @xmldata=BulkColumn
FROM 
OPENROWSET (BULK 'C:\Users\Adrian\Desktop\1234567.xml',SINGLE_BLOB) as T1

SELECT @xmldata as Dokument


DECLARE @xmldata XML


SELECT @xmldata=BulkColumn
FROM 
OPENROWSET (BULK 'C:\Users\Marek\Desktop\1234567.xml',SINGLE_BLOB) as T1


DECLARE @docHandle int
EXEC sp_xml_preparedocument @docHandle OUTPUT, @xmldata


INSERT INTO dbo.Catalog
SELECT 
	Author, Title, Genre, Price, PublishDate, Description
FROM
OPENXML(@docHandle, '/Catalog/Book', 2)
WITH
(	
	Author char(50),
    Title char(50),
    Genre char(50),
    Price varchar(100),
    PublishDate varchar(10),
	Description char(50)
)


EXEC sp_xml_removedocument @docHandle
GO

SELECT * from dbo.Catalog






