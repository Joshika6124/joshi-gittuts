USE MyAppDB;

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_ShippingAddresses_CustomerId' AND object_id = OBJECT_ID('ShippingAddresses'))
BEGIN
    CREATE INDEX IX_ShippingAddresses_CustomerId ON ShippingAddresses(CustomerId);
END