-- Create DB if it doesn't already exist
if not exists(select * from sys.databases WHERE name = "minesweeperDB")
begin
    create database minesweeper
end;

-- Switch to the minesweeper database
use minesweeper;

-- Create user table (if it doesn't exist)
if not exists (select * from sys.objects where object_id = OBJECT_ID(N'[dbo].[users]') and type in (N'U'))
begin 
    create table [dbo].[users] (
        [id] INT PRIMARY KEY IDENTITY(1,1),
        [firstName] VARCHAR(255) NOT NULL,
        [lastName] VARCHAR(255) NOT NULL,
        [sex] VARCHAR(50) NOT NULL,
        [age] INT NOT NULL,
        [state] VARCHAR(100) NOT NULL,
        [email] VARCHAR(255) NOT NULL,
        [userName] VARCHAR(255) NOT NULL,
        [password] VARCHAR(255) NOT NULL
    );
end;

if not exists (select * from sys.objects where object_id = OBJECT_ID(N'[dbo].[games]') and type in (N'U'))
begin 
    create table [dbo].[users] (
        [id] INT PRIMARY KEY IDENTITY(1,1),
        [date] DATETIME NOT NULL,
        [game] VARCHAR(max) NOT NULL,
    );
end;

-- Add some test data
insert into users (firstName, lastName, sex, age, state, email, userName, password) values
('John', 'Doe', 'Male', 30, 'California', 'john.doe@example.com', 'johndoe', 'password123'),
('Jane', 'Smith', 'Female', 25, 'New York', 'jane.smith@example.com', 'janesmith', 'securepass'),
('Alice', 'Johnson', 'Female', 28, 'Texas', 'alice.johnson@example.com', 'alicej', 'alice123'),
('Bob', 'Williams', 'Male', 35, 'Florida', 'bob.williams@example.com', 'bobby', 'bobsecure'),
('Charlie', 'Brown', 'Male', 40, 'Ohio', 'charlie.brown@example.com', 'charlieb', 'charliepass');
