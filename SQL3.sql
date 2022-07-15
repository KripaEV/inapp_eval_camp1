CREATE TABLE Department_table(
	deptno INT PRIMARY KEY,
	dname VARCHAR(15),
	loc VARCHAR(15)
)

CREATE TABLE Employee_table(
	empno INT PRIMARY KEY,
	ename VARCHAR(10),
	job VARCHAR(15),
	mgr INT,
	hiredate DATE,
	sal INT,
	commission INT,
	deptno INT FOREIGN KEY REFERENCES Department_table(deptno)
)

INSERT INTO Department_table VALUES
(10,'Accounting', 'New York'),
(20,'Research', 'Dallas'),
(30,'Sales', 'Chicago'),
(40,'Operations', 'Boston')

INSERT INTO Employee_table VALUES
(7839,'King','President',0,'1981-11-17', 5000,0, 10),
(7698,'Blake','Manager',7839,'1981-05-01',2850,0,30),
(7782,'Clark','Manager',7839,'1981-06-09',2450,0,10),
(7566,'Jones','Manager',7839,'1981-04-02',2975,0,20),
(7788,'Scott','Analyst',7566,'1982-12-09',3000,0,20),
(7902,'Ford','Analyst',7566,'1981-12-03',3000,0,20),
(7369,'Smith','Clerk',7902,'1980-12-17',800,0,20),
(7499,'Allen','Salesman',7698,'1981-02-20',1600,300,30),
(7521,'Ward','Salesman',7698,'1981-02-22',1250,500,30),
(7654,'Martin','Salesman',7698,'1981-09-28',1250,1400,30),
(7844,'Turner','Salesman',7698,'1981-09-08',1500,0,30),
(7876,'Adams','Clerk',7788,'1983-01-12',1100,0,20),
(7900,'James','Clerk',7698,'1981-12-03',950,0,30),
(7934,'Miller','Clerk',7782,'1982-01-23',1300,0,10)

SELECT * FROM Department_table
SELECT * FROM Employee_table

--1. Report needed: Names of employees who are manager.
--Hint: The names of people who have their own employeeID as the managerID
SELECT ename FROM Employee_table
WHERE empno=mgr

--2. List the name of all employees along with their department name and Annual Income.
--For each row get the output in the form ‘Every Year Mark of Accounts department
--earns amount 450000’. This output has to come under a heading ‘Annual income Report’.
SELECT CONCAT('Every year ',e1.ename,' of ',d1.dname,' department earns amount ',e1.commission) 
AS 'Annual Income Report'
FROM Employee_table e1, Department_table d1

--3. Report needed: Names of departments and names of employees. Names of departments
--in ascending order. Within the same department, employee name should be in the
--descending order
SELECT d1.dname, e1.ename FROM  Employee_table e1, Department_table d1
WHERE d1.deptno=e1.deptno
ORDER BY d1.dname, e1.ename DESC

--4. Find out employee name and departmentname of employees who either works in a Toy
--or Shoe department.
SELECT d1.dname, e1.ename FROM  Employee_table e1, Department_table d1
WHERE  d1.deptno=e1.deptno 
AND d1.dname='Toy' OR d1.dname='Shoe'

--5. Report needed: Name concatenated with department, separated by comma and space
--and name column Employee and department.
SELECT CONCAT(e1.ename,',', d1.dname) AS 'Employee and Department'
FROM  Employee_table e1, Department_table d1
WHERE  d1.deptno=e1.deptno 

--6. Write a query to display name, job, department number and department name for
--all employees who work in DALLAS.
SELECT e1.ename, e1.job, e1.deptno, d1.dname 
FROM  Employee_table e1, Department_table d1
WHERE  d1.deptno=e1.deptno AND d1.loc='Dallas' 

--7. List the names of all employees along with name of managers
SELECT e1.ename AS Employee, e2.ename AS Manager 
FROM Employee_table e1, Employee_table e2
WHERE e1.mgr=e2.empno

--8. Display all employee name, manager number and manager name of all employees
--including King who have no manager.
SELECT e1.ename AS Employee, e2.ename AS Manager 
FROM Employee_table e1, Employee_table e2
WHERE e1.mgr=e2.empno OR e2.mgr=0

--9. Display employee name, department number and all employees that work in same
--department as a given employee (‘Mathew’). Give each column an appropriate label.
SELECT e1.ename AS Employee, e1.deptno AS Department
FROM Employee_table e1, Employee_table e2
WHERE e1.ename='Mathew' AND e1.deptno=e2.deptno

--10. Create a unique listing of all jobs that are in department 30. Include location
--of department 30 in the output.
SELECT DISTINCT e1.job, d1.loc FROM Employee_table e1, Department_table d1
WHERE e1.deptno=d1.deptno AND e1.deptno=30
