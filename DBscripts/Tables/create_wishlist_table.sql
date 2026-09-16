USE MyAppDB;

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Wishlist')
BEGIN
    CREATE TABLE Wishlist (
        WishlistId INT IDENTITY(1,1) PRIMARY KEY,
        CustomerId INT NOT NULL,
        ProductId INT NOT NULL,
        AddedAt DATETIME DEFAULT GETDATE(),
        CONSTRAINT FK_Wishlist_Customers FOREIGN KEY (CustomerId) REFERENCES Customers(CustomerId),
        CONSTRAINT FK_Wishlist_Products FOREIGN KEY (ProductId) REFERENCES Products(ProductId)
    );
END