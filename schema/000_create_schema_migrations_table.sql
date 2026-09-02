USE MyAppDB;

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'SchemaMigrations')
BEGIN
    CREATE TABLE SchemaMigrations (
        Id INT IDENTITY(1,1) PRIMARY KEY,
        ScriptName NVARCHAR(255) NOT NULL UNIQUE,
        Checksum NVARCHAR(64) NOT NULL,
        AppliedAt DATETIME DEFAULT GETDATE(),
        Status NVARCHAR(20) DEFAULT 'Success'
    );
END