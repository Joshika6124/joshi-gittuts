USE MyAppDB;
GO

IF OBJECT_ID('dbo.UpdateOrderStatus', 'P') IS NOT NULL
    DROP PROCEDURE dbo.UpdateOrderStatus;
GO

CREATE PROCEDURE dbo.UpdateOrderStatus
    @OrderId INT,
    @NewStatus NVARCHAR(50)
AS
BEGIN
    UPDATE Orders SET Status = @NewStatus WHERE OrderId = @OrderId;
END
GO