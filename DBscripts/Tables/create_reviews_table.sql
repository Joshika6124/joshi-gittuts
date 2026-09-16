USE MyAppDB;

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Reviews')
BEGIN
    CREATE TABLE Reviews (
        ReviewId INT IDENTITY(1,1) PRIMARY KEY,
        ProductId INT NOT NULL,
        CustomerId INT NOT NULL,
        Rating INT NOT NULL,
        Comment NVARCHAR(1000),
        CreatedAt DATETIME DEFAULT GETDATE(),
        CONSTRAINT FK_Reviews_Products FOREIGN KEY (ProductId) REFERENCES Products(ProductId),
        CONSTRAINT FK_Reviews_Customers FOREIGN KEY (CustomerId) REFERENCES Customers(CustomerId)
    );
END