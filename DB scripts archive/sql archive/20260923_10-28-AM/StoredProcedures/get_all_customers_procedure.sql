USE MyAppDB;
GO

IF OBJECT_ID('dbo.GetAllCustomers', 'P') IS NOT NULL
    DROP PROCEDURE dbo.GetAllCustomers;
GO

CREATE PROCEDURE dbo.GetAllCustomers
AS
BEGIN
    SELECT CustomerId, FirstName, LastName, Email, Phone
    FROM Customers
    ORDER BY LastName;
END
GO