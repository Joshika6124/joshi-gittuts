USE MyAppDB;

IF NOT EXISTS (SELECT * FROM Categories WHERE Name = 'Electronics')
BEGIN
    INSERT INTO Categories (Name, Description) VALUES
    ('Electronics', 'Gadgets and devices'),
    ('Books', 'Fiction and non-fiction'),
    ('Clothing', 'Apparel for all ages');
END

IF NOT EXISTS (SELECT * FROM Products WHERE Name = 'Wireless Mouse')
BEGIN
    INSERT INTO Products (Name, CategoryId, Price, StockQuantity) VALUES
    ('Wireless Mouse', (SELECT CategoryId FROM Categories WHERE Name = 'Electronics'), 799.00, 50),
    ('Bluetooth Headphones', (SELECT CategoryId FROM Categories WHERE Name = 'Electronics'), 1999.00, 30),
    ('Novel: The Silent Patient', (SELECT CategoryId FROM Categories WHERE Name = 'Books'), 349.00, 100);
END