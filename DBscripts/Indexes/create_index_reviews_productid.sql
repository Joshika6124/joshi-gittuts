USE MyAppDB;

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_Reviews_ProductId' AND object_id = OBJECT_ID('Reviews'))
BEGIN
    CREATE INDEX IX_Reviews_ProductId ON Reviews(ProductId);
END