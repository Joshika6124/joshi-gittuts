USE MyAppDB;

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_Customers_Email' AND object_id = OBJECT_ID('Customers'))
BEGIN
    CREATE INDEX IX_Customers_Email ON Customers(Email);
END