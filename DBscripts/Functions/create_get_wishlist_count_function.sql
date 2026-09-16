USE MyAppDB;
GO
IF OBJECT_ID('dbo.GetWishlistCount', 'FN') IS NOT NULL
    DROP FUNCTION dbo.GetWishlistCount;
GO
CREATE FUNCTION dbo.GetWishlistCount (@CustomerId INT)
RETURNS INT
AS
BEGIN
    DECLARE @Count INT;
    SELECT @Count = COUNT(*) FROM Wishlist WHERE CustomerId = @CustomerId;
    RETURN ISNULL(@Count, 0);
END
GO