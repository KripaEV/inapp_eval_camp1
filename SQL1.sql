CREATE TABLE DepartmentDetails(
	dept_id INT PRIMARY KEY,
	dept_name VARCHAR(15)
)

CREATE TABLE EmployeeDetails(
	emp_id INT IDENTITY PRIMARY KEY,
	emp_name VARCHAR(15),
	pay INT,
	dept_id INT FOREIGN KEY REFERENCES DepartmentDetails(dept_id)
)

INSERT INTO DepartmentDetails VALUES
(1,'IT'),
(2,'Sales'),
(3,'Marketing'),
(4,'HR')

INSERT INTO EmployeeDetails VALUES
('Dilip',3000,1),
('Fahad',4000,2),
('Lal',6000,3),
('Nivin',2000,1),
('Vijay',9000,2),
('Anu',5000,4),
('Nimisha',5000,2),
('Praveena',8000,3)

SELECT * FROM DepartmentDetails

SELECT * FROM EmployeeDetails

--1. The total number of employees.
SELECT COUNT(*) AS 'Total no of employees' FROM EmployeeDetails

--2. Total amount required to pay all employees.
SELECT SUM(pay) AS 'Total amt to pay all employees' FROM EmployeeDetails

--3. Average, minimum and maximum pay in the organization.
--AVG PAY
SELECT AVG(pay) AS 'AVG PAY' FROM EmployeeDetails

--MIN PAY
SELECT MIN(pay) AS 'MIN PAY' FROM EmployeeDetails

--MAX PAY
SELECT MAX(pay) AS 'MAX PAY' FROM EmployeeDetails

--4. Each Department wise total pay
SELECT dept_id, SUM(pay) AS 'Sum per department' FROM EmployeeDetails
GROUP BY dept_id

--5. Average, minimum and maximum pay department-wise.
--AVG PAY
SELECT dept_id, AVG(pay) AS 'Avg per department' FROM EmployeeDetails
GROUP BY dept_id

--MIN PAY
SELECT dept_id, MIN(pay) AS 'Min per department' FROM EmployeeDetails
GROUP BY dept_id

--MAX PAY
SELECT dept_id, MAX(pay) AS 'Max per department' FROM EmployeeDetails
GROUP BY dept_id

--6. Employee details who earns the maximum pay.
SELECT * FROM EmployeeDetails 
WHERE pay = (SELECT MAX(pay) AS 'MAX PAY' FROM EmployeeDetails)  

--7. Employee details who is having a maximum pay in the department.
SELECT * FROM EmployeeDetails 
WHERE pay = (SELECT MAX(pay) AS 'Max per department' FROM EmployeeDetails
GROUP BY dept_id)   

--9. Employee who has more pay than the average pay of his department.

--10. Unique departments in the company
SELECT DISTINCT dept_name FROM DepartmentDetails 

--11. Employees In increasing order of pay
SELECT * FROM EmployeeDetails
ORDER BY pay

--12. Department In increasing order of paySELECT * FROM DepartmentDetailsJOIN EmployeeDetails ON ORDER BY pay