USE MyAppDB;
GO

IF OBJECT_ID('dbo.Reviews', 'U') IS NOT NULL
   AND COL_LENGTH('dbo.Reviews', 'ProductId') IS NOT NULL
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM sys.indexes
        WHERE name = 'IX_Reviews_ProductId'
          AND object_id = OBJECT_ID('dbo.Reviews')
    )
    BEGIN
        CREATE INDEX IX_Reviews_ProductId
        ON dbo.Reviews(ProductId);
    END
END