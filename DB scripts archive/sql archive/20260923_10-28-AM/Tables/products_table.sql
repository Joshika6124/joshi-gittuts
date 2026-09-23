USE MyAppDB;

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Products')
BEGIN
    CREATE TABLE Products (
        ProductId INT IDENTITY(1,1) PRIMARY KEY,
        Name NVARCHAR(150) NOT NULL,
        Price DECIMAL(10,2) NOT NULL,
        StockQuantity INT DEFAULT 0,
        CreatedAt DATETIME DEFAULT GETDATE()
    );
END