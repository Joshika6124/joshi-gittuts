USE MyAppDB;
IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('Users') AND name = 'TestCol2')
BEGIN
    ALTER TABLE Users ADD TestCol2 NVARCHAR(50) NULL;
END