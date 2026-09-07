USE MyAppDB;

-- 1. Create a table if it doesn't exist
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'BulkConditionsTest')
BEGIN
    CREATE TABLE BulkConditionsTest (
        Id INT IDENTITY(1,1) PRIMARY KEY,
        Label NVARCHAR(100),
        Status NVARCHAR(50) DEFAULT 'Pending',
        CreatedAt DATETIME DEFAULT GETDATE()
    );
END

-- 2. Add a column only if it's missing
IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('BulkConditionsTest') AND name = 'Notes')
BEGIN
    ALTER TABLE BulkConditionsTest ADD Notes NVARCHAR(255) NULL;
END

-- 3. Insert a row only if it doesn't already exist
IF NOT EXISTS (SELECT * FROM BulkConditionsTest WHERE Label = 'Row One')
BEGIN
    INSERT INTO BulkConditionsTest (Label, Notes) VALUES ('Row One', 'Inserted by bulk test');
END

-- 4. Insert a second row, same guard pattern
IF NOT EXISTS (SELECT * FROM BulkConditionsTest WHERE Label = 'Row Two')
BEGIN
    INSERT INTO BulkConditionsTest (Label, Notes) VALUES ('Row Two', 'Inserted by bulk test');
END

-- 5. Conditionally update a row, only if it's still in its default state
IF EXISTS (SELECT * FROM BulkConditionsTest WHERE Label = 'Row One' AND Status = 'Pending')
BEGIN
    UPDATE BulkConditionsTest SET Status = 'Processed' WHERE Label = 'Row One';
END

-- 6. Create an index only if it doesn't already exist
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_BulkConditionsTest_Label' AND object_id = OBJECT_ID('BulkConditionsTest'))
BEGIN
    CREATE INDEX IX_BulkConditionsTest_Label ON BulkConditionsTest(Label);
END

-- 7. Conditionally drop a column, only if it exists
IF EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('BulkConditionsTest') AND name = 'SomeOldColumnThatMightNotExist')
BEGIN
    ALTER TABLE BulkConditionsTest DROP COLUMN SomeOldColumnThatMightNotExist;
END

-- 8. Validation-style check
IF EXISTS (SELECT * FROM BulkConditionsTest WHERE Status = 'Processed')
BEGIN
    PRINT 'Validation passed: at least one row is marked Processed.';
END
ELSE
BEGIN
    PRINT 'Validation note: no rows are Processed yet.';
END