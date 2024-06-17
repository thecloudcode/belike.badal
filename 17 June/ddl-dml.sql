CREATE DATABASE IF NOT EXISTS SampleDB;
USE SampleDB;

DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Departments;

CREATE TABLE Departments (
    DeptID INT AUTO_INCREMENT PRIMARY KEY,
    DeptName VARCHAR(50) NOT NULL
);

CREATE TABLE Employees (
    EmpID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100),
    HireDate DATE,
    Salary DECIMAL(10, 2),
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

INSERT INTO Departments (DeptName) VALUES 
('Human Resources'),
('IT'),
('Finance'),
('Marketing');

INSERT INTO Employees (FirstName, LastName, Email, HireDate, Salary, DeptID) VALUES
('John', 'Doe', 'john.doe@example.com', '2021-01-15', 60000.00, 2),
('Jane', 'Smith', 'jane.smith@example.com', '2020-03-22', 65000.00, 1),
('Alice', 'Johnson', 'alice.johnson@example.com', '2019-11-30', 70000.00, 3),
('Bob', 'Brown', 'bob.brown@example.com', '2022-05-17', 50000.00, 4);

UPDATE Employees
SET Salary = 72000.00
WHERE EmpID = 3;

DELETE FROM Employees
WHERE EmpID = 4;

SELECT * FROM Employees;

SELECT e.FirstName, e.LastName, d.DeptName
FROM Employees e
JOIN Departments d ON e.DeptID = d.DeptID
WHERE d.DeptName = 'IT';

SELECT d.DeptName, COUNT(e.EmpID) AS NumEmployees
FROM Departments d
LEFT JOIN Employees e ON d.DeptID = e.DeptID
GROUP BY d.DeptName;

ALTER TABLE Employees
ADD COLUMN PhoneNumber VARCHAR(15);

UPDATE Employees
SET PhoneNumber = '555-1234'
WHERE EmpID = 1;

CREATE INDEX idx_email ON Employees(Email);

DROP INDEX idx_email ON Employees;

DROP TABLE Employees;

DROP TABLE Departments;

DROP DATABASE SampleDB;
