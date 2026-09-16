USE MyAppDB;

IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('Products') AND name = 'SupplierId')
BEGIN
    ALTER TABLE Products ADD SupplierId INT NULL;
END