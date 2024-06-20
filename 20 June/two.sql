CREATE DATABASE IF NOT EXISTS CompanyDB;
USE CompanyDB;

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

DELIMITER //

CREATE PROCEDURE GetEmployeesByDepartment(IN deptID INT)
BEGIN
    SELECT 
        e.EmployeeID,
        e.FirstName,
        e.LastName,
        d.DepartmentName,
        e.HireDate
    FROM 
        Employees e
    JOIN 
        Departments d ON e.DepartmentID = d.DepartmentID
    WHERE 
        e.DepartmentID = deptID;
END //

DELIMITER ;

CALL GetEmployeesByDepartment(1);

DELIMITER //

CREATE FUNCTION GetTotalSalary(empID INT) RETURNS DECIMAL(10,2)
BEGIN
    DECLARE totalSalary DECIMAL(10,2);
    SELECT SUM(SalaryAmount) INTO totalSalary
    FROM Salaries
    WHERE EmployeeID = empID;
    RETURN totalSalary;
END //

DELIMITER ;

SELECT GetTotalSalary(1) AS TotalSalary;

DELIMITER //

CREATE PROCEDURE ListEmployeesAndSalaries()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE empID INT;
    DECLARE empFirstName VARCHAR(50);
    DECLARE empLastName VARCHAR(50);
    DECLARE cur CURSOR FOR SELECT EmployeeID, FirstName, LastName FROM Employees;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO empID, empFirstName, empLastName;
        IF done THEN
            LEAVE read_loop;
        END IF;
        
        SELECT 
            e.EmployeeID,
            e.FirstName,
            e.LastName,
            s.SalaryAmount
        FROM 
            Employees e
        JOIN 
            (SELECT EmployeeID, SalaryAmount 
             FROM Salaries s1
             WHERE EffectiveDate = (SELECT MAX(EffectiveDate) 
                                    FROM Salaries s2 
                                    WHERE s1.EmployeeID = s2.EmployeeID)
            ) s ON e.EmployeeID = s.EmployeeID
        WHERE 
            e.EmployeeID = empID;
    END LOOP;

    CLOSE cur;
END //

DELIMITER ;

CALL ListEmployeesAndSalaries();

DELIMITER ;

DROP PROCEDURE IF EXISTS GetEmployeesByDepartment;
DROP FUNCTION IF EXISTS GetTotalSalary;
DROP PROCEDURE IF EXISTS ListEmployeesAndSalaries;

-- Drop tables and database after use
-- DROP TABLE Employees;
-- DROP TABLE Departments;
-- DROP TABLE Salaries;
-- DROP DATABASE CompanyDB;
