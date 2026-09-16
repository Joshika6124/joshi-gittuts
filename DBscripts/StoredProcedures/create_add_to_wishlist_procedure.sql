USE MyAppDB;
GO
IF OBJECT_ID('dbo.AddToWishlist', 'P') IS NOT NULL
    DROP PROCEDURE dbo.AddToWishlist;
GO
CREATE PROCEDURE dbo.AddToWishlist
    @CustomerId INT, @ProductId INT
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM Wishlist WHERE CustomerId = @CustomerId AND ProductId = @ProductId)
    BEGIN
        INSERT INTO Wishlist (CustomerId, ProductId) VALUES (@CustomerId, @ProductId);
    END
END
GO