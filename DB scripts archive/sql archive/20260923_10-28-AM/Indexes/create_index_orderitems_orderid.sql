USE MyAppDB;

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_OrderItems_OrderId' AND object_id = OBJECT_ID('OrderItems'))
BEGIN
    CREATE INDEX IX_OrderItems_OrderId ON OrderItems(OrderId);
END