USE MyAppDB;

IF NOT EXISTS (SELECT * FROM Customers WHERE Email = 'ravi.kumar@example.com')
BEGIN
    INSERT INTO Customers (FirstName, LastName, Email, City) VALUES
    ('Ravi', 'Kumar', 'ravi.kumar@example.com', 'Guntur'),
    ('Anita', 'Sharma', 'anita.sharma@example.com', 'Hyderabad');
END

IF NOT EXISTS (SELECT * FROM Orders WHERE CustomerId = (SELECT CustomerId FROM Customers WHERE Email = 'ravi.kumar@example.com'))
BEGIN
    INSERT INTO Orders (CustomerId, Status, TotalAmount) VALUES
    ((SELECT CustomerId FROM Customers WHERE Email = 'ravi.kumar@example.com'), 'Completed', 2798.00);
END