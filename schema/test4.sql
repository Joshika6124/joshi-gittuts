USE MyAppDB;

IF NOT EXISTS (SELECT * FROM Users WHERE Email = 'testbulk@example.com')
BEGIN
    INSERT INTO Users (Name, Email) VALUES ('Bulk Test User', 'testbulk@example.com');
END