USE MyAppDB;

IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('Products') AND name = 'IsActive')
BEGIN
    ALTER TABLE Products ADD IsActive BIT DEFAULT 1;
END