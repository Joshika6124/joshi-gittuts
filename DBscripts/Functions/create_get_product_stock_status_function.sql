USE MyAppDB;
GO

IF OBJECT_ID('dbo.GetProductStockStatus', 'FN') IS NOT NULL
    DROP FUNCTION dbo.GetProductStockStatus;
GO

CREATE FUNCTION dbo.GetProductStockStatus (@ProductId INT)
RETURNS NVARCHAR(20)
AS
BEGIN
    DECLARE @Qty INT;
    DECLARE @Status NVARCHAR(20);
    SELECT @Qty = StockQuantity FROM Products WHERE ProductId = @ProductId;

    SET @Status = CASE
        WHEN @Qty IS NULL THEN 'Unknown'
        WHEN @Qty = 0 THEN 'Out of Stock'
        WHEN @Qty < 10 THEN 'Low Stock'
        ELSE 'In Stock'
    END;

    RETURN @Status;
END
GO