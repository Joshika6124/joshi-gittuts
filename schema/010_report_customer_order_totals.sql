USE MyAppDB;

SELECT
    c.FirstName + ' ' + c.LastName AS CustomerName,
    c.City,
    COUNT(o.OrderId) AS TotalOrders,
    SUM(o.TotalAmount) AS TotalSpent
FROM Customers c
LEFT JOIN Orders o ON c.CustomerId = o.CustomerId
GROUP BY c.FirstName, c.LastName, c.City
ORDER BY TotalSpent DESC;