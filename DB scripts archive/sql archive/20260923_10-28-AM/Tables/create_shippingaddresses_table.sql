USE MyAppDB;

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'ShippingAddresses')
BEGIN
    CREATE TABLE ShippingAddresses (
        ShippingAddressId INT IDENTITY(1,1) PRIMARY KEY,
        CustomerId INT NOT NULL,
        AddressLine NVARCHAR(255) NOT NULL,
        City NVARCHAR(100),
        PostalCode NVARCHAR(20),
        CONSTRAINT FK_ShippingAddresses_Customers FOREIGN KEY (CustomerId) REFERENCES Customers(CustomerId)
    );
END