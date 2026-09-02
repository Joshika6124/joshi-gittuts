USE MyAppDB;

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Orders')
BEGIN
    CREATE TABLE Orders (
        OrderId INT IDENTITY(1,1) PRIMARY KEY,
        CustomerId INT NOT NULL,
        OrderDate DATETIME DEFAULT GETDATE(),
        Status NVARCHAR(50) DEFAULT 'Pending',
        TotalAmount DECIMAL(10,2) NOT NULL,
        CONSTRAINT FK_Orders_Customers FOREIGN KEY (CustomerId) REFERENCES Customers(CustomerId)
    );
END