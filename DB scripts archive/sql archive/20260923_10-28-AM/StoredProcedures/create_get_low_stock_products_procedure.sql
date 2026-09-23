USE MyAppDB;
GO

IF OBJECT_ID('dbo.GetLowStockProducts', 'P') IS NOT NULL
    DROP PROCEDURE dbo.GetLowStockProducts;
GO

CREATE PROCEDURE dbo.GetLowStockProducts
    @Threshold INT = 10
AS
BEGIN
    SELECT ProductId, Name, StockQuantity
    FROM Products
    WHERE StockQuantity < @Threshold
    ORDER BY StockQuantity ASC;
END
GO