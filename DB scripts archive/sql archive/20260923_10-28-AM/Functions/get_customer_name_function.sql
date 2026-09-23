USE MyAppDB;
GO

IF OBJECT_ID('dbo.GetCustomerFullName', 'FN') IS NOT NULL
    DROP FUNCTION dbo.GetCustomerFullName;
GO

CREATE FUNCTION dbo.GetCustomerFullName (@CustomerId INT)
RETURNS NVARCHAR(210)
AS
BEGIN
    DECLARE @FullName NVARCHAR(210);
    SELECT @FullName = FirstName + ' ' + LastName
    FROM Customers
    WHERE CustomerId = @CustomerId;
    RETURN @FullName;
END
GO