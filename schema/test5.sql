USE MyAppDB;

IF EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('Users') AND name = 'TestCol1')
BEGIN
    ALTER TABLE Users DROP COLUMN TestCol1;
END