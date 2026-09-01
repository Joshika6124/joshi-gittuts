--test trigger
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'MyAppDB')
BEGIN
    CREATE DATABASE MyAppDB;
END