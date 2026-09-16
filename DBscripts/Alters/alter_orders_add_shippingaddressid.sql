USE MyAppDB;

IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('Orders') AND name = 'ShippingAddressId')
BEGIN
    ALTER TABLE Orders ADD ShippingAddressId INT NULL;
END