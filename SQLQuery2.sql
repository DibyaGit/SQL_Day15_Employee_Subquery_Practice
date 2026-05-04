
USE CompanyDB_2;
GO


DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Departments;
GO


CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50),
    Location VARCHAR(50)
);

CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Salary DECIMAL(10,2),
    DeptID INT
);


INSERT INTO Departments (DeptID, DeptName, Location) VALUES
(1, 'IT', 'Delhi'),
(2, 'HR', 'Mumbai'),
(3, 'Sales', 'Delhi');

INSERT INTO Employees (EmpID, EmpName, Salary, DeptID) VALUES
(101, 'Amit', 60000, 1),
(102, 'Priya', 45000, 2),
(103, 'Rahul', 80000, 1),
(104, 'Neha', 50000, 3),
(105, 'Vikas', 90000, 3),
(106, 'Sonia', 40000, 2);
GO

-- T1
SELECT * FROM Employees
WHERE Salary > (SELECT AVG(Salary) FROM Employees);

-- T2
SELECT * FROM Employees
WHERE DeptID IN (SELECT DeptID FROM Departments WHERE Location = 'Delhi');

-- T3
SELECT * FROM Employees
WHERE Salary = (SELECT MAX(Salary) FROM Employees);

-- T4
SELECT * FROM Employees e1
WHERE Salary > (SELECT AVG(Salary) FROM Employees e2 WHERE e1.DeptID = e2.DeptID);

-- T5
SELECT * FROM Employees e1
WHERE Salary = (SELECT MAX(Salary) FROM Employees e2 WHERE e1.DeptID = e2.DeptID);

-- T6
SELECT DeptID FROM Employees
GROUP BY DeptID
HAVING AVG(Salary) > (SELECT AVG(Salary) FROM Employees);

-- T7
SELECT e.*
FROM Employees e
JOIN (SELECT DeptID, AVG(Salary) AS AvgSal FROM Employees GROUP BY DeptID) d_avg
ON e.DeptID = d_avg.DeptID
WHERE e.Salary > d_avg.AvgSal;

-- T8
SELECT e.*
FROM Employees e
JOIN (SELECT DeptID, MAX(Salary) AS MaxSal FROM Employees GROUP BY DeptID) d_max
ON e.DeptID = d_max.DeptID
WHERE e.Salary = d_max.MaxSal;

-- T9
SELECT e.EmpName, d.DeptName, e.Salary
FROM Employees e
JOIN Departments d ON e.DeptID = d.DeptID
JOIN (SELECT DeptID, AVG(Salary) AS AvgSal FROM Employees GROUP BY DeptID) d_avg
ON e.DeptID = d_avg.DeptID
WHERE e.Salary > d_avg.AvgSal AND d.Location = 'Delhi';