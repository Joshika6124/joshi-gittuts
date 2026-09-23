USE MyAppDB;
GO

IF OBJECT_ID('dbo.GetCustomerOrderCount', 'FN') IS NOT NULL
    DROP FUNCTION dbo.GetCustomerOrderCount;
GO

CREATE FUNCTION dbo.GetCustomerOrderCount (@CustomerId INT)
RETURNS INT
AS
BEGIN
    DECLARE @Count INT;
    SELECT @Count = COUNT(*) FROM Orders WHERE CustomerId = @CustomerId;
    RETURN ISNULL(@Count, 0);
END
GO