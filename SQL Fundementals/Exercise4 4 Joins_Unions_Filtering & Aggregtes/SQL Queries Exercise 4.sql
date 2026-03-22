
/*__________________________________________________________________________________________________________________________
                                JOINS, UNION, FILTERING AND AGGREGATES
____________________________________________________________________________________________________________________________*/

---Creating a table 1 DATA DEFINITION LANGUAGE
CREATE TABLE employee_1

(employeeIDs INT NOT NULL, 
first_name VARCHAR (50) NOT NULL, 
last_name VARCHAR (50) NOT NULL, 
departments VARCHAR (50) NOT NULL, 
salary  INT NOT NULL,
city VARCHAR (50) NOT NULL,
Age INT NOT NULL, 
CONSTRAINT unique_employeeIDs PRIMARY KEY (employeeIDs));


-- INSERT VALUES INTO employee_1 TABLE

INSERT INTO employee_1
(employeeIDs,first_name,last_name, departments, salary, city, Age)

VALUES  (1,'John','Doe','IT',70000,'New York', 35),
        (2,'Alice','Smith','HR',60000,'Los Angeles',40),
        (3,'Bob','Johnson','Finance',75000,'Toronto',45),
        (4,'David','Brown','IT',72000,'London',30),
        (5,'Emma','Wilson', 'Sales',65000,'Sydney',28),  
        (6,'Michael','Clark', 'Finance',80000,'New York',50);

select * from employee_1;


---Creating a table 2 DATA DEFINITION LANGUAGE
CREATE TABLE Projects

(ProjectID INT NOT NULL, 
EmployeeIDs INT NOT NULL,
ProjectName VARCHAR (50) NOT NULL,  
Budget  INT NOT NULL,
StartDate DATE NOT NULL,
Status VARCHAR (50) NOT NULL, 
CONSTRAINT unique_ProjectID PRIMARY KEY (ProjectID));


-- INSERT VALUES INTO Projects TABLE

INSERT INTO Projects
(ProjectID,EmployeeIDs,ProjectName, Budget,StartDate, Status)

VALUES  (101,1,'AI Development',100000,'2024-01-10','Completed'),
        (102,2,'Employee Training',50000,'2024-02-15','Ongoing'),
        (103,1,'Cybersecurity Audit',75000,'2024-03-05','Pending'),
        (104,3,'Financial Analysis',90000,'2024-04-12','Ongoing'),
        (105,5,'Market Expansion',65000,'2024-05-20','Completed'),
        (106,6,'Risk Management',80000,'2024-06-10','Pending');

select * from Projects;



/*______________________________________________________________________________________

                                QUESTIONS
_________________________________________________________________________________________*/

-- SQL Joins
/*1. SQL Joins 
1. Retrieve all employees and their assigned projects using an INNER JOIN. 
o Return: EmployeeID, FirstName, LastName, Department, Salary, 
ProjectID, ProjectName, Budget, Status.*/

SELECT 
        employee_1.employeeIDs,
        employee_1.first_name,
        employee_1.last_name,
        employee_1.departments,
        employee_1.salary,
        projects.ProjectID,
        projects.ProjectName,
        projects.Budget,
        projects.Status
FROM employee_1
INNER JOIN Projects
ON employee_1.employeeIDs = Projects.EmployeeIDs;


/*2. Retrieve all employees and their assigned projects, including employees who 
have no projects using a LEFT JOIN. 
o Return: EmployeeID, FirstName, LastName, Department, Salary, 
ProjectID, ProjectName, Budget, Status.*/

SELECT 
        employee_1.employeeIDs,
        employee_1.first_name,
        employee_1.last_name,
        employee_1.departments,
        employee_1.salary,
        projects.ProjectID,
        projects.ProjectName,
        projects.Budget,
        projects.Status
FROM employee_1
LEFT JOIN Projects
ON employee_1.employeeIDs = Projects.EmployeeIDs;






/*3. Retrieve all projects and their assigned employees, including projects that have 
no employees using a RIGHT JOIN. 
o Return: ProjectID, ProjectName, Budget, Status, EmployeeID, FirstName, 
LastName, Department, Salary.*/

SELECT 
        employee_1.employeeIDs,
        employee_1.first_name,
        employee_1.last_name,
        employee_1.departments,
        employee_1.salary,
        projects.ProjectID,
        projects.ProjectName,
        projects.Budget,
        projects.Status
FROM projects
LEFT JOIN employee_1
ON employee_1.employeeIDs = Projects.EmployeeIDs;

--SAME RESULTS JUST CHANGE THE POSITION OF TABLES


/*4. Retrieve all employees and projects, including those without a match in either 
table using a FULL OUTER JOIN. 
o Return: EmployeeID, FirstName, LastName, Department, Salary, 
ProjectID, ProjectName, Budget, Status. */

SELECT 
        employee_1.employeeIDs,
        employee_1.first_name,
        employee_1.last_name,
        employee_1.departments,
        employee_1.salary,
        projects.ProjectID,
        projects.ProjectName,
        projects.Budget,
        projects.Status
FROM employee_1
FULL OUTER JOIN Projects
ON employee_1.employeeIDs = Projects.EmployeeIDs;


/*_______________________________________________________________________________________
                                UNION & UNION ALL
________________________________________________________________________________________*/

/*5. Retrieve a list of all unique cities where employees are located and project 
statuses. 
o Return: Location (Rename the column to Location using an alias). */

SELECT DISTINCT(city) as Location
FROM employee_1
UNION                                 
SELECT DISTINCT(Status) AS Location
FROM projects;


/*6. Retrieve a list of all cities where employees are located and project statuses, 
allowing duplicates. 
o Return: Location (Rename the column to Location using an alias).*/

SELECT DISTINCT(city) as Location
FROM employee_1
UNION ALL                                 
SELECT DISTINCT(Status) AS Location
FROM projects;



/*_____________________________________________________________________________________
                        FILTERING STATEMENTS
_______________________________________________________________________________________*/
        
/*7.Retrieve employees who earn more than 70,000. 
o Return: EmployeeID, FirstName, LastName, Department, Salary.*/

SELECT 
        employee_1.employeeIDs,
        employee_1.first_name,
        employee_1.last_name,
        employee_1.departments,
        employee_1.salary
        
FROM employee_1
Where salary >70000;


/*8. Retrieve employees working in either IT or Finance departments. 
o Return: EmployeeID, FirstName, LastName, Department, Salary. */

SELECT 
        employee_1.employeeIDs,
        employee_1.first_name,
        employee_1.last_name,
        employee_1.departments,
        employee_1.salary
        
FROM employee_1
Where departments IN ('IT', 'Finance');


/*9. Retrieve projects that are not yet completed. 
o Return: ProjectID, ProjectName, Budget, Status. */

SELECT 
        projects.ProjectID,
        projects.ProjectName,
        projects.Budget,
        projects.Status
        
        
FROM projects
WHERE Status NOT IN ('Completed');


/*10. Retrieve projects that have a budget greater than 70,000 and are not 
completed. 
o Return: ProjectID, ProjectName, Budget, Status. */
SELECT 
        projects.ProjectID,
        projects.ProjectName,
        projects.Budget,
        projects.Status
        
        
FROM projects
WHERE  Budget>70000 AND Status NOT IN ('Completed');


/*11. Retrieve employees from New York OR Toronto, ordered by salary in 
descending order. 
• Return: EmployeeID, FirstName, LastName, Department, Salary, City. */



SELECT 
        employee_1.employeeIDs,
        employee_1.first_name,
        employee_1.last_name,
        employee_1.departments,
        employee_1.salary,
        employee_1.city
        
FROM employee_1
WHERE city IN ('New York', 'Toronto')
ORDER BY salary DESC;


/*12. Retrieve the top 3 highest-paid employees. 
• Return: EmployeeID, FirstName, LastName, Department, Salary.*/
SELECT 
        employee_1.employeeIDs,
        employee_1.first_name,
        employee_1.last_name,
        employee_1.departments,
        employee_1.salary,
        employee_1.city
        
FROM employee_1
ORDER BY salary DESC
LIMIT 3;


/*_________________________________________________________________________________________
                 Aggregate Functions with GROUP BY & HAVING 
__________________________________________________________________________________________*/

/*13. Find the total salary per department, sorted in descending order. 
• Return: Department, TotalSalary (Rename SUM(Salary) as TotalSalary). */



SELECT 
        departments,
        SUM(salary) AS TotalSalary
FROM employee_1
GROUP BY departments
ORDER BY totalsalary DESC;


/*14. Find the average salary per city, but only include cities where the average salary 
is greater than 65,000. 
• Return: City, AverageSalary (Rename AVG(Salary) as AverageSalary).*/

SELECT 
        city,
        AVG(salary) AS AverageSalary
FROM employee_1
GROUP BY city
ORDER BY AverageSalary DESC;



/*15. Count the number of employees per department, including only departments 
with more than 1 employee. 
• Return: Department, EmployeeCount (Rename COUNT(EmployeeID) as 
EmployeeCount). */

SELECT 
        departments,
        Count(*) AS EmployeeCount
FROM employee_1
GROUP BY departments;



/*16. Retrieve the number of projects per status, but only include statuses with at 
least 2 projects. 
• Return: Status, ProjectCount (Rename COUNT(ProjectID) as ProjectCount). */

SELECT 
        
        projects.Status,
        count(ProjectID) AS ProjectCount
        
FROM projects
GROUP BY projects.Status
HAVING COUNT(ProjectID)>2;



/*17. Retrieve the total project budget per employee, but only for employees who are 
managing projects worth more than 150,000. 
• Return: EmployeeID, FirstName, LastName, TotalProjectBudget (RenameSUM(Budget) as TotalProjectBudget).*/


SELECT 
        employee_1.employeeIDs,
        employee_1.first_name,
        employee_1.last_name,
        SUM(Budget) AS TotalProjectBudget
        
FROM employee_1
INNER JOIN projects ON employee_1.employeeIDs=projects.EmployeeIDs 
GROUP BY employee_1.employeeIDs,  employee_1.first_name, employee_1.last_name
HAVING totalprojectbudget>150000;
