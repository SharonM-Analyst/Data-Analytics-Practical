--Drop the previous table
DROP TABLE employee_db;
/*_______________________________________________________________________________________
Employee_db
_________________________________________________________________________________________*/

---Creating a table DATA DEFINITION LANGUAGE
CREATE TABLE employee_db

(id INT NOT NULL, 
first_name VARCHAR (50) NOT NULL, 
last_name VARCHAR (50) NOT NULL, 
departments VARCHAR (50) NOT NULL, 
salary  INT NOT NULL,
hire_date VARCHAR(50) NOT NULL,
city VARCHAR (50) NOT NULL, 
CONSTRAINT unique_id PRIMARY KEY (id));


-- INSERT VALUES INTO PRODUCT TABLE

INSERT INTO employee_db
(id,first_name,last_name, departments, salary, hire_date, city)

VALUES  (1,'John','Doe','IT',55000,'2018-06-15','New York'),
        (2,'Jane','Smith','HR',48000, '2019-07-20','Chicago'),
        (3,'Mike','Johnson','Finance',60000, '2017-09-30','Los Angeles'),
        (4,'Sarah','Brown','IT',53000, '2021-03-25','New York'),
        (5,'David','White', 'Marketing',52000, '2016-04-10','San Francisco'),
        (6,'Emily','Davis', 'IT',62000, '2015-02-14','Chicago'),
        (7,'Robert','Wilson', 'Finance',59000, '2019-10-01','Houston'),
        (8,'Jessica','Moore','HR',51000, '2018-05-22','Los Angeles'),
        (9,'Daniel','Clark', 'Maarketing',53000, '2022-06-01','Chicago'),
        (10,'Laura','Hall', 'IT',50000, '2020-08-10','San Francisco');

        
/*1. SELECT Statement 
Write a SQL query to retrieve all columns from the employees table. 
*/
Select * 
From `workspace`.`default`.`employee_db`; 

/*2. SELECT DISTINCT Statement 
Write a SQL query to find all the unique departments in the employees table.*/

Select Distinct departments 
From `workspace`.`default`.`employee_db`;

/*3. ORDER BY Statement 
Write a SQL query to retrieve all employees' first and last names, ordered by salary in 
descending order. */
SELECT * 
FROM  `workspace`.`default`.`employee_db` 
ORDER BY salary DESC;

/*4. LIMIT Statement 
Write a SQL query to retrieve the top 5 highest-paid employees. */
SELECT * 
FROM `workspace`.`default`.`employee_db` 
ORDER BY salary DESC LIMIT 5;

/*5. WHERE Statement 
Write a SQL query to find employees who work in the IT department. */
SELECT * 
FROM `workspace`.`default`.`employee_db` 
WHERE departments = 'IT' ;

/*6. AND Statement 
Write a SQL query to find employees who work in the Finance department AND have a 
salary greater than 58,000. */
SELECT * 
FROM `workspace`.`default`.`employee_db` 
WHERE departments = 'Finance' 
AND salary > 58000;

/*7. OR Statement 
Write a SQL query to find employees who work in the HR department OR the Marketing 
department. */
SELECT * 
FROM `workspace`.`default`.`employee_db` 
WHERE departments = 'HR' OR departments = 'Marketing';

/*8. NOT Statement 
Write a SQL query to find employees who do not work in the IT department. */
SELECT * 
FROM `workspace`.`default`.`employee_db` 
Where departments != 'IT';

/*9. IN Statement 
Write a SQL query to find employees who are in the HR, IT, or Finance departments. */
SELECT * 
FROM `workspace`.`default`.`employee_db` 
Where departments IN('HR','IT','Finance');

/*10. Combining Conditions 
Write a SQL query to find employees who are in the IT department, have a salary greater 
than 50,000, and are located in New York. */
SELECT * 
FROM  `workspace`.`default`.`employee_db` 
Where departments='IT' 
AND salary > 50000 
AND city = 'New York';

/*11. Combining WHERE, AND, and ORDER BY 
Write a SQL query to retrieve the first and last names of employees who work in the 
Finance or Marketing department, earn more than 52,000, and order the results by 
salary in descending order.*/
SELECT * 
FROM  `workspace`.`default`.`employee_db`
Where departments IN('IT','Marketing') 
AND salary > 52000 
ORDER BY salary DESC;


/*12. Combining SELECT DISTINCT, WHERE, and IN 
Write a SQL query to find all the unique cities where employees work, excluding those 
in the IT and HR departments. */

SELECT
DISTINCT city
FROM `workspace`.`default`.`employee_db` 
WHERE departments NOT IN('IT','HR');


/*13. Combining WHERE, NOT, AND, and ORDER BY 
Write a SQL query to retrieve employees who are NOT in the Finance department, 
have a salary greater than 50,000, and order the results by hire date in ascending 
order. */

SELECT *
FROM `workspace`.`default`.`employee_db`
WHERE departments != 'Finnce'
AND salary>50000
ORDER BY hire_date ASC;



/*14. Combining WHERE, OR, IN, and LIMIT 
Write a SQL query to find the first 3 employees who work in either Chicago or Los 
Angeles and belong to the IT or Marketing department.*/

SELECT *
FROM `workspace`.`default`.`employee_db`
WHERE (city='Chicago' OR city='Los Angeles')
AND departments IN('IT','Marketing')
LIMIT 3;
