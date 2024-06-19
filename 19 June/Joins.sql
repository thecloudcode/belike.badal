CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES 
    (1, 'IT'),
    (2, 'Finance'),
    (3, 'HR');

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

INSERT INTO Employees (EmployeeID, EmployeeName, DepartmentID)
VALUES 
    (1, 'John Doe', 1),
    (2, 'Jane Smith', 2),
    (3, 'Michael Johnson', 1),
    (4, 'Emily Brown', 3);

SELECT Employees.EmployeeID, Employees.EmployeeName, Departments.DepartmentName
FROM Employees
INNER JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID;

SELECT Employees.EmployeeID, Employees.EmployeeName, Departments.DepartmentName
FROM Employees
LEFT JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID;

SELECT Employees.EmployeeID, Employees.EmployeeName, Departments.DepartmentName
FROM Employees
RIGHT JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID;

SELECT Employees.EmployeeID, Employees.EmployeeName, Departments.DepartmentName
FROM Employees
LEFT JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID
UNION
SELECT Employees.EmployeeID, Employees.EmployeeName, Departments.DepartmentName
FROM Departments
LEFT JOIN Employees ON Employees.DepartmentID = Departments.DepartmentID;

SELECT Employees.EmployeeID, Employees.EmployeeName, Departments.DepartmentName
FROM Employees
CROSS JOIN Departments;

SELECT e1.EmployeeName AS Employee1, e2.EmployeeName AS Employee2
FROM Employees e1, Employees e2
WHERE e1.EmployeeID <> e2.EmployeeID
AND e1.DepartmentID = e2.DepartmentID;

SELECT Employees.EmployeeID, Employees.EmployeeName, Departments.DepartmentName
FROM Employees
NATURAL JOIN Departments;
