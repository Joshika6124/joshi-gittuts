USE MyAppDB;
GO

IF OBJECT_ID('dbo.AddProduct', 'P') IS NOT NULL
    DROP PROCEDURE dbo.AddProduct;
GO

CREATE PROCEDURE dbo.AddProduct
    @Name NVARCHAR(150),
    @Price DECIMAL(10,2),
    @StockQuantity INT
AS
BEGIN
    INSERT INTO Products (Name, Price, StockQuantity)
    VALUES (@Name, @Price, @StockQuantity);
END
GO