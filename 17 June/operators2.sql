CREATE DATABASE IF NOT EXISTS LearnOperators;
USE LearnOperators;

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT,
    Salary DECIMAL(10, 2),
    Department VARCHAR(50),
    StartDate DATE
);

INSERT INTO Employees (FirstName, LastName, Age, Salary, Department, StartDate) VALUES
('John', 'Doe', 30, 60000, 'Engineering', '2020-01-15'),
('Jane', 'Smith', 25, 55000, 'Marketing', '2019-03-22'),
('Emily', 'Jones', 45, 75000, 'Engineering', '2015-06-10'),
('Michael', 'Brown', 28, 65000, 'Sales', '2021-09-01'),
('Sarah', 'Davis', 35, 70000, 'HR', '2018-11-12');

SELECT * FROM Employees;

SELECT FirstName, LastName, Salary, Salary + 5000 AS IncreasedSalary FROM Employees;

SELECT * FROM Employees WHERE Age > 30;

SELECT * FROM Employees WHERE Department = 'Engineering' AND Salary > 60000;

SELECT * FROM Employees WHERE LastName LIKE 'S%';

SELECT * FROM Employees WHERE Department IN ('Engineering', 'HR');

SELECT * FROM Employees WHERE StartDate BETWEEN '2018-01-01' AND '2020-12-31';

SELECT * FROM Employees WHERE Salary IS NULL;

UPDATE Employees SET Salary = Salary * 1.10 WHERE Department = 'Sales';

DELETE FROM Employees WHERE Age > 40;

SELECT * FROM Employees;

DROP TABLE IF EXISTS Employees;

DROP DATABASE IF EXISTS LearnOperators;
