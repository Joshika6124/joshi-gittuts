USE MyAppDB;

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Suppliers')
BEGIN
    CREATE TABLE Suppliers (
        SupplierId INT IDENTITY(1,1) PRIMARY KEY,
        Name NVARCHAR(150) NOT NULL,
        ContactEmail NVARCHAR(255),
        CreatedAt DATETIME DEFAULT GETDATE()
    );
END