USE MyAppDB;

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'PaymentTransactions')
BEGIN
    CREATE TABLE PaymentTransactions (
        TransactionId INT IDENTITY(1,1) PRIMARY KEY,
        OrderId INT NOT NULL,
        Amount DECIMAL(10,2) NOT NULL,
        TransactionDate DATETIME DEFAULT GETDATE(),
        CONSTRAINT FK_PaymentTransactions_Orders FOREIGN KEY (OrderId) REFERENCES Orders(OrderId)
    );
END