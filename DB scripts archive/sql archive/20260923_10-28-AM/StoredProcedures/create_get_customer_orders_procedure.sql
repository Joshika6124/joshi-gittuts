USE MyAppDB;
GO

IF OBJECT_ID('dbo.GetCustomerOrders', 'P') IS NOT NULL
    DROP PROCEDURE dbo.GetCustomerOrders;
GO

CREATE PROCEDURE dbo.GetCustomerOrders (@CustomerId INT)
AS
BEGIN
    SELECT OrderId, OrderDate, Status, TotalAmount
    FROM Orders
    WHERE CustomerId = @CustomerId
    ORDER BY OrderDate DESC;
END
GO