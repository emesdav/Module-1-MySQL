## Using the `mysql` client
Open up a terminal window from the **Tools->Terminal** menu.

Once the terminal window is open, just type `mysql` into the command line and a new `mysql>` client will start on the **MariaDB** system (similar to the MySQL system). 

### Running `mysql` statements
The `mysql` client is enabled with all the database and table editing and reading privileges so you can experiment as much as you want.

### For this Assessment
There are two tables available in the database `COMPANY1` which should be used for this assessment activity.  First, type the command 
```sql
USE COMPANY1;
```
to ensure you are in the right database before carrying out the instructions provided.

Then play the *Guide* (**Tools->Guide->Play**)to start the assignment.
![playGuide](https://global.codio.com/platform/readme.resources/playGuide.png)

You are expected to submit a README file along with your code file.  
Your README file should contain a description of the solutions you have implemented, 
as well as any alternative approaches. Your code should include comments explaining the code. 
You will receive marks for unsuccessful answers if they build a logical argument.

## SOLUTION DESCRIPTION AND ALTERNATIVES
For the purpose of clarity in this document, we will give Alias to the 2 tables in use and as follows;
```EMP AS EmployeesTable```
```DEPT AS DepartmentsTable```

## 1. List all Employees whose salary is between 1,000 AND 2,000. Show the Employee Name, Department and Salary
Employee Name and Salary exist in the EmployeesTable and Department Name exist in Department Table. Both Tables are linked by DEPTNO as Unique key.

We therefore do a 
```LEFT JOIN```
from EmployeesTable to DepartmentsTable. This way we have all the data in EmployeesTable and matching records from DepartmentsTable.

We then set the condition to display all salary that is between 1000 and 2000.

For the purpose of readability, we group the results by DEPTNO.

**ALTERNATIVE SOLUTION**
An Alternative Solution would be to set a condition for salary being greater than 1000 and lower than 2000
```Salary >= 1000 AND Salary <= 20000;```


## 2. Count the number of people in department 30 who receive a salary and the number of people who receive a commission
All required data exists in the EmployeesTable. An assumption based on a study of the data is that all salaried workers would have at least 0.00 which is a representation of a number in under the SAL column in their records. so in the absence of any, a null is recorded which is the absence of salary. Same assumption is made of the commissioned salaried workers.

We therefore get the sum total of all values in the column SAL where value is not null.
Then we do the same with the COMM column for the commissions.

Then we specify the results to only display data from the department of value 30. 

And for readability, we group the results by DEPTNO which represents the Department Number.

**ALTERNATIVE SOLUTION**

An alternative solution would be to simply query all data in the EmployeesTable and set conditions to ensure 


## 3. Find the name and salary of employees in Dallas
Required data here comes from both EmployeesTable and DepartmentsTable so we left Join EmployeesTable to DepartmentsTable in order to get all data in EmployeesTable and matching records in DepartmentsTable.

When we have unified both tables, we set a condition to display only data where location is "DALLAS".


We then group this by Employee Name for easy readability.


## 4. List all departments that do not have any employees
We need data from both tables since the scenario presented already gives the possibility of data existing in at least DepartmentsTable but not in EmployeesTable.

We therefore Left Join DepartmentsTable to EmployeesTable and this then provides us with all of DepartmentsTable and matching data from EmployeesTable.

What this means is, where there is no matching data, NULL fields are returned.

So we set a condition for any DEPTNO (department Number) that has NULLfrom EmployeesTable and record that as a Department with no employees.


**ALTERNATIVE SOLUTION**
An alternative here would be to nest SQL calls so for each Department, we search for employees in the EmployeesTable and if result is NULL, we conclude Department has no Employees.

## 5. List the department number and average salary of each department
We select distinctly from both tables using a left join to unify the 2 tables. we left join DepartmentsTable to EmployeesTable since the Departments table is most likely to provide acurate data of all departments.

We then make a nested call which is almost like a for each command.the purpose of the nested command is to get the Average of all salaries under the department.

We then Group by DEPT which is the Department's Number for easy readabiliy.

**ALTERNATIVE SOLUTION**
An alternative solution would be to get the average of each department's salary seperately, meaning through several individual SQL calls. this option may be most likely to produce acurate results but for a large system, we may have issues such as is commonly called the BigO Notation.


## GENERAL ALTERNATIVES
A common alternative Solution to all of the above solutions would be to use a Right Join, Full Join or stored procedures.


## References
Oracle Corporation (2019). MySQL :: MySQL 8.0 Reference Manual. [online] Mysql.com. Available at: https://dev.mysql.com/doc/refman/8.0/en/.

‌W3Schools (2019). SQL Tutorial. [online] W3schools.com. Available at: https://www.w3schools.com/sql/default.asp.

‌freeCodeCamp.org. (2020). What is Big O Notation Explained: Space and Time Complexity. [online] Available at: https://www.freecodecamp.org/news/big-o-notation-why-it-matters-and-why-it-doesnt-1674cfa8a23c/.

Big O Notation. (n.d.). [online] Available at: https://web.mit.edu/16.070/www/lecture/big_o.pdf.

Vicente García Díaz, Manuel, J., Pelayo, C., Oscar Sanjuán Martínez and Al, E. (2013). Progressions and innovations in model-driven software engineering. Hershey (Pa.): Engineering Science Reference, Cop.

‌‌
