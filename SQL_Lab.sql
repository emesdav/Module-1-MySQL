--Start 
mysql;

--Select Database
USE COMPANY1;

--[1]List all Employees whose salary is between 1,000 AND 2,000. Show the Employee Name, Department and Salary
SELECT 
  EMP.ENAME
AS
  EmployeeName, 
  DEPT.DNAME
AS DepartmentName, 
  EMP.SAL
AS
  EmployeeSalary
FROM 
  EMP 
LEFT JOIN 
  DEPT 
ON 
  DEPT.DEPTNO = EMP.DEPTNO
WHERE
  EMP.SAL 
BETWEEN 
  1000 AND 2000
GROUP BY
  EMP.ENAME;

--[2]Count the number of people in department 30 who receive a salary and the number of people who receive a commission
SELECT 
  SUM(SAL IS NOT NULL) 
AS 
  ReceiveSalary, 
  SUM(COMM IS NOT NULL) 
AS 
  ReceiveCommission 
FROM 
  EMP 
WHERE 
  DEPTNO = 30
GROUP BY
  DEPTNO;

--[3]Find the name and salary of employees in Dallas
SELECT 
  EMP.ENAME
AS
  EmployeeName, 
  EMP.SAL
AS
  EmployeeSalary
FROM 
  EMP 
LEFT JOIN 
  DEPT 
ON 
  DEPT.DEPTNO = EMP.DEPTNO 
WHERE 
  DEPT.LOC = "DALLAS"
GROUP BY
  EMP.ENAME;

--[4]List all departments that do not have any employees
SELECT 
  DEPT.DNAME 
AS 
  NoEmployeeDepartment 
FROM 
  DEPT 
LEFT JOIN 
  EMP 
ON 
  DEPT.DEPTNO = EMP.DEPTNO 
WHERE 
  EMP.DEPTNO IS NULL
GROUP BY
  DEPT.DEPTNO;


--[5]List the department number and average salary of each department
SELECT DISTINCT 
  DEPT.DEPTNO AS DepartmentNO, 
  (SELECT 
        AVG(EMP.SAL) 
  FROM 
        EMP 
  WHERE 
        DEPT.DEPTNO = EMP.DEPTNO) 
AS 
  averageSalary 
FROM 
  DEPT 
LEFT JOIN 
  EMP 
ON 
  DEPT.DEPTNO = EMP.DEPTNO
GROUP BY
  DEPT.DEPTNO;