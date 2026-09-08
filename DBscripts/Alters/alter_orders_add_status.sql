USE MyAppDB;

IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('Orders') AND name = 'Status')
BEGIN
    ALTER TABLE Orders ADD Status NVARCHAR(50) DEFAULT 'Pending';
END