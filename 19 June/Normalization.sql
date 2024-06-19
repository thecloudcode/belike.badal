CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    DepartmentID INT,
    CONSTRAINT fk_DepartmentID FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);

CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(100),
    DepartmentID INT,
    CONSTRAINT fk_DepartmentID_Projects FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

CREATE TABLE Assignments (
    AssignmentID INT PRIMARY KEY,
    EmployeeID INT,
    ProjectID INT,
    CONSTRAINT fk_EmployeeID FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    CONSTRAINT fk_ProjectID FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID)
);

CREATE INDEX idx_DepartmentID_Employees ON Employees(DepartmentID);
CREATE INDEX idx_DepartmentID_Projects ON Projects(DepartmentID);
CREATE INDEX idx_EmployeeID_Assignments ON Assignments(EmployeeID);
CREATE INDEX idx_ProjectID_Assignments ON Assignments(ProjectID);

ALTER TABLE Employees ADD CONSTRAINT fk_DepartmentID FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID);

ALTER TABLE Projects ADD CONSTRAINT fk_DepartmentID_Projects FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID);

ALTER TABLE Assignments ADD CONSTRAINT fk_EmployeeID FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID);

ALTER TABLE Assignments ADD CONSTRAINT fk_ProjectID FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID);
