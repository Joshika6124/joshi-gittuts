USE MyAppDB;

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_Products_CategoryId' AND object_id = OBJECT_ID('Products'))
BEGIN
    CREATE INDEX IX_Products_CategoryId ON Products(CategoryId);
END