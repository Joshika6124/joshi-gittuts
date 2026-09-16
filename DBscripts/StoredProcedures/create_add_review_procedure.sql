USE MyAppDB;
GO
IF OBJECT_ID('dbo.AddReview', 'P') IS NOT NULL
    DROP PROCEDURE dbo.AddReview;
GO
CREATE PROCEDURE dbo.AddReview
    @ProductId INT, @CustomerId INT, @Rating INT, @Comment NVARCHAR(1000)
AS
BEGIN
    INSERT INTO Reviews (ProductId, CustomerId, Rating, Comment)
    VALUES (@ProductId, @CustomerId, @Rating, @Comment);
END
GO
