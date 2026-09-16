USE MyAppDB;
GO
IF OBJECT_ID('dbo.GetOrderShippingStatus', 'FN') IS NOT NULL
    DROP FUNCTION dbo.GetOrderShippingStatus;
GO
CREATE FUNCTION dbo.GetOrderShippingStatus (@OrderId INT)
RETURNS NVARCHAR(50)
AS
BEGIN
    DECLARE @AddrId INT;
    SELECT @AddrId = ShippingAddressId FROM Orders WHERE OrderId = @OrderId;
    RETURN CASE WHEN @AddrId IS NULL THEN 'No Address Set' ELSE 'Ready to Ship' END;
END
GO