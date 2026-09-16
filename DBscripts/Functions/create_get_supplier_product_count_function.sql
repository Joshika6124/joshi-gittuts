USE MyAppDB;
GO
IF OBJECT_ID('dbo.GetSupplierProductCount', 'FN') IS NOT NULL
    DROP FUNCTION dbo.GetSupplierProductCount;
GO
CREATE FUNCTION dbo.GetSupplierProductCount (@SupplierId INT)
RETURNS INT
AS
BEGIN
    DECLARE @Count INT;
    SELECT @Count = COUNT(*) FROM Products WHERE SupplierId = @SupplierId;
    RETURN ISNULL(@Count, 0);
END
GO