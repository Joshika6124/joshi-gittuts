USE MyAppDB;

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_Suppliers_Name' AND object_id = OBJECT_ID('Suppliers'))
BEGIN
    CREATE INDEX IX_Suppliers_Name ON Suppliers(Name);
END