USE MyAppDB;
GO
IF OBJECT_ID('dbo.GetSupplierProducts', 'P') IS NOT NULL
    DROP PROCEDURE dbo.GetSupplierProducts;
GO
CREATE PROCEDURE dbo.GetSupplierProducts
    @SupplierId INT
AS
BEGIN
    SELECT ProductId, Name, Price, StockQuantity FROM Products WHERE SupplierId = @SupplierId;
END
GO

#sqlarchieve
