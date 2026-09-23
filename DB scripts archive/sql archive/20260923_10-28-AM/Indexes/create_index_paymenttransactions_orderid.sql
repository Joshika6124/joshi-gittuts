USE MyAppDB;

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_PaymentTransactions_OrderId' AND object_id = OBJECT_ID('PaymentTransactions'))
BEGIN
    CREATE INDEX IX_PaymentTransactions_OrderId ON PaymentTransactions(OrderId);
END