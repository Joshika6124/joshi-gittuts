USE MyAppDB;
GO
IF OBJECT_ID('dbo.GetTopRatedProducts', 'P') IS NOT NULL
    DROP PROCEDURE dbo.GetTopRatedProducts;
GO
CREATE PROCEDURE dbo.GetTopRatedProducts
    @TopN INT = 5
AS
BEGIN
    SELECT TOP (@TopN) p.ProductId, p.Name, AVG(CAST(r.Rating AS DECIMAL(3,2))) AS AvgRating
    FROM Products p
    JOIN Reviews r ON p.ProductId = r.ProductId
    GROUP BY p.ProductId, p.Name
    ORDER BY AvgRating DESC;
END
GO