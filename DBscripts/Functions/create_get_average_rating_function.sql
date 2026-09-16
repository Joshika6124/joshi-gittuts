USE MyAppDB;
GO
IF OBJECT_ID('dbo.GetAverageRating', 'FN') IS NOT NULL
    DROP FUNCTION dbo.GetAverageRating;
GO
CREATE FUNCTION dbo.GetAverageRating (@ProductId INT)
RETURNS DECIMAL(3,2)
AS
BEGIN
    DECLARE @Avg DECIMAL(3,2);
    SELECT @Avg = AVG(CAST(Rating AS DECIMAL(3,2))) FROM Reviews WHERE ProductId = @ProductId;
    RETURN ISNULL(@Avg, 0);
END
GO
