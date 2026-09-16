USE MyAppDB;

IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('PaymentTransactions') AND name = 'Status')
BEGIN
    ALTER TABLE PaymentTransactions ADD Status NVARCHAR(50) DEFAULT 'Pending';
END