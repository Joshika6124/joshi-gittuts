CREATE OR ALTER PROCEDURE dbo.GetCustomerById
    @CustomerId INT
AS
BEGIN
    SELECT CustomerId, FirstName, LastName, Email, Phone, CreatedAt
    FROM Customer
    WHERE CustomerId = @CustomerId;
END;
