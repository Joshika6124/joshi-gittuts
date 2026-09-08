USE MyAppDB;

IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('Products') AND name = 'CategoryId')
BEGIN
    ALTER TABLE Products ADD CategoryId INT NULL;
END