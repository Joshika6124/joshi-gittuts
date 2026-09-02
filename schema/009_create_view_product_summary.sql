USE MyAppDB;

IF EXISTS (SELECT * FROM sys.views WHERE name = 'vw_ProductSummary')
    DROP VIEW vw_ProductSummary;
GO

CREATE VIEW vw_ProductSummary AS
SELECT
    p.ProductId,
    p.Name AS ProductName,
    c.Name AS CategoryName,
    p.Price,
    p.StockQuantity
FROM Products p
LEFT JOIN Categories c ON p.CategoryId = c.CategoryId;
GO