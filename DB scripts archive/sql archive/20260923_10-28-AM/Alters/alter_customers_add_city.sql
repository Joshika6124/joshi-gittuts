USE MyAppDB;

IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('Customers') AND name = 'City')
BEGIN
    ALTER TABLE Customers ADD City NVARCHAR(100) NULL;
END