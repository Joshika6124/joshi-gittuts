USE MyAppDB;

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'TempBulkTestTable')
BEGIN
    CREATE TABLE TempBulkTestTable (
        Id INT IDENTITY(1,1) PRIMARY KEY,
        Note NVARCHAR(100)
    );
END