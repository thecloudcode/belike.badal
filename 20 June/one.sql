CREATE TABLE IF NOT EXISTS Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT,
    HireDate DATE
);

CREATE TABLE IF NOT EXISTS Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Salaries (
    EmployeeID INT,
    SalaryAmount DECIMAL(10, 2),
    EffectiveDate DATE,
    PRIMARY KEY (EmployeeID, EffectiveDate)
);

INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID, HireDate) VALUES
(1, 'John', 'Doe', 1, '2015-06-01'),
(2, 'Jane', 'Smith', 2, '2018-03-15'),
(3, 'Michael', 'Brown', 1, '2020-11-20'),
(4, 'Emily', 'Davis', 3, '2017-05-23');

INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'Engineering'),
(2, 'Marketing'),
(3, 'Sales');

INSERT INTO Salaries (EmployeeID, SalaryAmount, EffectiveDate) VALUES
(1, 60000, '2020-01-01'),
(1, 65000, '2021-01-01'),
(2, 55000, '2019-01-01'),
(2, 60000, '2020-01-01'),
(3, 70000, '2020-11-20'),
(4, 50000, '2017-05-23'),
(4, 55000, '2018-05-23');

SELECT 
    e.EmployeeID,
    e.FirstName,
    e.LastName,
    d.DepartmentName,
    s.SalaryAmount
FROM 
    Employees e
JOIN 
    Departments d ON e.DepartmentID = d.DepartmentID
JOIN 
    (SELECT EmployeeID, SalaryAmount 
     FROM Salaries s1
     WHERE EffectiveDate = (SELECT MAX(EffectiveDate) 
                            FROM Salaries s2 
                            WHERE s1.EmployeeID = s2.EmployeeID)
    ) s ON e.EmployeeID = s.EmployeeID;

SELECT 
    e.EmployeeID,
    e.FirstName,
    e.LastName
FROM 
    Employees e
WHERE 
    e.DepartmentID IN (
        SELECT DepartmentID
        FROM Departments d
        WHERE d.DepartmentID NOT IN (
            SELECT DISTINCT DepartmentID
            FROM Employees
            WHERE EmployeeID = e.EmployeeID AND HireDate <> '2015-06-01'
        )
    );

SELECT 
    e.EmployeeID,
    e.FirstName,
    e.LastName,
    e.HireDate,
    CURRENT_DATE AS CurrentDate,
    DATEDIFF(CURRENT_DATE, e.HireDate) AS TenureDays,
    TIMESTAMPDIFF(YEAR, e.HireDate, CURRENT_DATE) AS TenureYears
FROM 
    Employees e;

SELECT 
    e.EmployeeID,
    e.FirstName,
    e.LastName,
    s1.SalaryAmount AS OldSalary,
    s2.SalaryAmount AS NewSalary
FROM 
    Employees e
JOIN 
    Salaries s1 ON e.EmployeeID = s1.EmployeeID
JOIN 
    Salaries s2 ON e.EmployeeID = s2.EmployeeID
WHERE 
    s1.EffectiveDate = (SELECT MAX(EffectiveDate) FROM Salaries WHERE EmployeeID = e.EmployeeID AND EffectiveDate < CURRENT_DATE - INTERVAL 1 YEAR)
AND 
    s2.EffectiveDate = (SELECT MAX(EffectiveDate) FROM Salaries WHERE EmployeeID = e.EmployeeID AND EffectiveDate >= CURRENT_DATE - INTERVAL 1 YEAR)
AND 
    s1.SalaryAmount < s2.SalaryAmount;

-- Drop the tables after use
-- DROP TABLE Employees;
-- DROP TABLE Departments;
-- DROP TABLE Salaries;
