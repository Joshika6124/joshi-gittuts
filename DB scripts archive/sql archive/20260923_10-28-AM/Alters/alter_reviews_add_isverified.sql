USE MyAppDB;

IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('Reviews') AND name = 'IsVerified')
BEGIN
    ALTER TABLE Reviews ADD IsVerified BIT DEFAULT 0;
END