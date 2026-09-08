USE MyAppDB;
GO

IF OBJECT_ID('dbo.GetCategoryProductCount', 'FN') IS NOT NULL
    DROP FUNCTION dbo.GetCategoryProductCount;
GO

CREATE FUNCTION dbo.GetCategoryProductCount (@CategoryId INT)
RETURNS INT
AS
BEGIN
    DECLARE @Count INT;
    SELECT @Count = COUNT(*) FROM Products WHERE CategoryId = @CategoryId;
    RETURN ISNULL(@Count, 0);
END
GO