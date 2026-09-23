USE MyAppDB;

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_Wishlist_CustomerId' AND object_id = OBJECT_ID('Wishlist'))
BEGIN
    CREATE INDEX IX_Wishlist_CustomerId ON Wishlist(CustomerId);
END