CREATE OR ALTER FUNCTION dbo.GetFullName (@CustomerId INT)
RETURNS NVARCHAR(201)
AS
BEGIN
    DECLARE @FullName NVARCHAR(201);

    SELECT @FullName = FirstName + ' ' + LastName
    FROM Customer
    WHERE CustomerId = @CustomerId;

    RETURN @FullName;
END;
