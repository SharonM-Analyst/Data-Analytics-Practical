/*_______________________________________________________________________________________________________________________________
Exercis 2: Employee_db(Data Set)
_________________________________________________________________________________________________________________________________*/

/*1. COUNT() Function 
Write a SQL query to find the total number of employees in the company. */
SELECT count(*)
FROM  `workspace`.`default`.`employee_db`;



/*2. SUM() Function 
Write a SQL query to find the total salary paid to all employees in the IT department.*/
SELECT 
       Sum (salary) as Total_Salary_IT
FROM  `workspace`.`default`.`employee_db`
WHERE departments = 'IT' ;


/*3. AVG() Function 
Write a SQL query to calculate the average salary of employees in the HR department. */
SELECT 
       AVG (salary) as AVG_Salary_HR
FROM  `workspace`.`default`.`employee_db`
WHERE departments = 'HR' ;

/*4. MIN() and MAX() Functions 
Write a SQL query to find the highest and lowest salary in the company. */

SELECT 
       Min (salary) as lowest_Salary,
       Max (salary) as Highest_salary
FROM  `workspace`.`default`.`employee_db`;

/*5. GROUP BY Statement 
Write a SQL query to group employees by department and display the total salary 
paid in each department. */
SELECT 

       departments,
       Sum (salary) as Total_Salary_department
FROM  `workspace`.`default`.`employee_db`
GROUP BY departments;



/*6. GROUP BY and COUNT() 
Write a SQL query to count how many employees work in each city. */

SELECT 
       city,
       COUNT (CITY) as employee_number_city
FROM  `workspace`.`default`.`employee_db`
GROUP BY city;


/*7. GROUP BY and ORDER BY 
Write a SQL query to group employees by department, calculate the average salary in 
each department, and order the results in descending order of average salary. */

SELECT 

       departments,
       AVG (salary) as AVG_Salary_department
FROM  `workspace`.`default`.`employee_db`
GROUP BY departments
ORDER BY avg_salary_department;


/*8. HAVING Clause 
Write a SQL query to find departments where the total salary paid exceeds 100,000. 
(Use GROUP BY and HAVING) */
SELECT 

       departments,
       Sum (salary) as Total_Salary_department
FROM  `workspace`.`default`.`employee_db`
GROUP BY departments
HAVING Total_Salary_department > 100000;


/*9. Combining GROUP BY, HAVING, and ORDER BY 
Write a SQL query to list cities where more than one employee works, ordered by the 
number of employees in descending order. */

SELECT 
       city,
       COUNT (CITY) as employee_number_city
FROM  `workspace`.`default`.`employee_db`
GROUP BY city
HAVING employee_number_city > 1
ORDER BY employee_number_city DESC;

/*10. Combining Aggregate Functions 
Write a SQL query to find the department with the highest average salary.*/

SELECT 

       departments,
       AVG (salary) as AVG_Salary_department
FROM  `workspace`.`default`.`employee_db`
GROUP BY departments
ORDER BY avg_salary_department DESC;
