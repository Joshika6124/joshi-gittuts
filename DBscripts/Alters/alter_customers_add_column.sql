USE MyAppDB;

IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('Customers') AND name = 'Phone')
BEGIN
    ALTER TABLE Customers ADD Phone NVARCHAR(20) NULL;
END