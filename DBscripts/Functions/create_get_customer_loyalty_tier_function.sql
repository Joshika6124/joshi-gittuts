USE MyAppDB;
GO
IF OBJECT_ID('dbo.GetCustomerLoyaltyTier', 'FN') IS NOT NULL
    DROP FUNCTION dbo.GetCustomerLoyaltyTier;
GO
CREATE FUNCTION dbo.GetCustomerLoyaltyTier (@CustomerId INT)
RETURNS NVARCHAR(20)
AS
BEGIN
    DECLARE @Points INT;
    SELECT @Points = LoyaltyPoints FROM Customers WHERE CustomerId = @CustomerId;
    RETURN CASE
        WHEN @Points IS NULL OR @Points < 100 THEN 'Bronze'
        WHEN @Points < 500 THEN 'Silver'
        ELSE 'Gold'
    END;
END
GO