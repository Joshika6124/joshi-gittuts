USE MyAppDB;

IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('Customers') AND name = 'LoyaltyPoints')
BEGIN
    ALTER TABLE Customers ADD LoyaltyPoints INT DEFAULT 0;
END