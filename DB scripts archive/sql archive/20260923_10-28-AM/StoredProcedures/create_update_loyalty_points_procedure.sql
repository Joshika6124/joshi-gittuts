USE MyAppDB;
GO
IF OBJECT_ID('dbo.UpdateLoyaltyPoints', 'P') IS NOT NULL
    DROP PROCEDURE dbo.UpdateLoyaltyPoints;
GO
CREATE PROCEDURE dbo.UpdateLoyaltyPoints
    @CustomerId INT, @PointsToAdd INT
AS
BEGIN
    UPDATE Customers SET LoyaltyPoints = LoyaltyPoints + @PointsToAdd WHERE CustomerId = @CustomerId;
END
GO