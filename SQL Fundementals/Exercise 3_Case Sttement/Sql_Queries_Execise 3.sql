/*_______________________________________________________________________________________
PRODUCTS TABLE
_________________________________________________________________________________________*/

---Creating a table DATA DEFINITION LANGUAGE
CREATE TABLE PRODUCT

(product_id INT NOT NULL, 
product_name VARCHAR (50) NOT NULL, 
unit_price  INT NOT NULL,
CONSTRAINT unique_product_id PRIMARY KEY (product_id));


-- INSERT VALUES INTO PRODUCT TABLE

INSERT INTO PRODUCT
(product_id,product_name,unit_price)

VALUES  (1,'Laptop',1200.00),
        (2,'Phone',800.00),
        (3,'Keyboard',45.00),
        (4,'Monitor',300.00),
        (5,'Mouse',25.00);

-- Retrieve all rows from PRODUCT table
select * from `workspace`.`default`.`product` limit 5; 

-- Complete The exercise, bright learner!

SELECT 
        product_id,
        product_name,
        unit_price, 
CASE 
        WHEN unit_price > 1000 THEN 'Expensive' 
        WHEN unit_price BETWEEN 100 AND 1000 THEN 'Moderate'
        ELSE 'Budget'
END price_category
FROM `workspace`.`default`.`product` LIMIT 5;



/*_______________________________________________________________________________________
ORDERS TABLE
_________________________________________________________________________________________*/


---Creating a table DATA DEFINITION LANGUAGE
CREATE TABLE Orders

(order_id INT NOT NULL, 
customer_name VARCHAR (50) NOT NULL, 
amount  INT NOT NULL,
CONSTRAINT unique_order_id PRIMARY KEY (order_id));


-- INSERT VALUES INTO Orders TABLE

INSERT INTO Orders
(order_id,customer_name,amount)

VALUES  (1,'Alice',150.00),
        (2,'Bob',560.00),
        (3,'Charlie',999.99),
        (4,'Diana',45.50),
        (5,'Ethan',1200.00);

-- Retrieve all rows from Orders table
select * from `workspace`.`default`.`orders` limit 5; 

-- Complete The exercise, bright learner!

SELECT 
        order_id,
        customer_name,
        amount, 
CASE 
        WHEN amount > 1000 THEN 'High Value' 
        WHEN amount BETWEEN 500 AND 999.99 THEN 'Medium Value'
        ELSE 'Low Value'
END order_value_category
FROM `workspace`.`default`.`orders` LIMIT 5;



/*_______________________________________________________________________________________________
  EMPLOYEES TABLE
 _________________________________________________________________________________________________*/

CREATE TABLE Employees

(employee_id INT NOT NULL, 
employee_name VARCHAR (50) NOT NULL, 
department VARCHAR(50) NOT NULL,
salary  INT NOT NULL,
CONSTRAINT unique_employee_id PRIMARY KEY (employee_id));

-- INSERT VALUES INTO Employees TABLE

INSERT INTO Employees
(employee_id,employee_name,department,salary)

VALUES  (1,'John','IT',85000),
        (2,'Sara','HR',60000),
        (3,'Mark','IT',75000),
        (4,'Lucy','Finance',95000),
        (5,'Tom','HR',55000);

-- Retrieve all rows from Employees table
select * from `workspace`.`default`.`employees` limit 5;

--Categorize employee position: 

--If in 'IT' and salary > 80000 → 'Senior IT' 
--If in 'HR' and salary > 55000 → 'Experienced HR' 
--Otherwise → 'Staff' 

select 
      `employee_name`,
      department,
      salary,
     
  CASE
        when department = 'IT' and salary > 80000 then 'Senior IT'
        when department = 'HR' and salary > 55000 then 'Experienced HR'
        else 'Staff'
    END position_level
from `workspace`.`default`.`employees` limit 5




/*_______________________________________________________________________________________________
  STUDENTS TABLE
 _________________________________________________________________________________________________*/

CREATE TABLE Students

(student_id INT NOT NULL, 
student_name VARCHAR (50) NOT NULL, 
Score INT NOT NULL,
CONSTRAINT unique_student_id PRIMARY KEY (student_id));


INSERT INTO Students
(student_id,student_name,Score)

VALUES  (1,'Anna',92),
        (2,'Ben',76),
        (3,'Cara',59),
        (4,'David',83),
        (5,'Ella',68);

-- Retrieve all rows from Students table
select * from `workspace`.`default`.`Students` limit 5;

--Assign a letter grade: 
-- ≥ 90: 'A' 
-- 80–89: 'B' 
-- 70–79: 'C' 
-- 60–69: 'D' 
-- < 60: 'F'

select 
      `student_name`,
      score,
      
     
  CASE
        when score >= 90 then 'A'
        when score between 80 and 89 then 'B'
        when score between 70 and 79 then 'C'
        when score between 60 and 69 then 'D'
        else 'F'
    END Grade
from `workspace`.`default`.`Students` 
limit 5;


/*______________________________________________________________________________________________
  Deliveries TABLE
 _________________________________________________________________________________________________*/

CREATE TABLE Deliveries

(delivery_id INT NOT NULL,  
delivery_time_minutes INT NOT NULL,
CONSTRAINT unique_delivery_id PRIMARY KEY (delivery_id));


INSERT INTO Deliveries
(delivery_id,delivery_time_minutes)

VALUES  (1,45),
        (2,80),
        (3,30),
        (4,65),
        (5,100);

-- Retrieve all rows from Deliveries table
select * from `workspace`.`default`.`Deliveries` limit 5;

/* Label delivery performance: 
● ≤ 30 mins: 'Fast' 
● 31–60 mins: 'On Time' 
● 60 mins: 'Late' */

select 
      `delivery_id`,
      `delivery_time_minutes`,
      
     
  CASE
        when delivery_time_minutes <= 30 then 'Fast'
        when delivery_time_minutes between 31 and 60 then 'On Time'
        when delivery_time_minutes >= 60 then 'Late'
    END Delivery_Performance
from `workspace`.`default`.`Deliveries` 
limit 5;


/*_______________________________________________________________________________________________
  TICKETS TABLE
 _________________________________________________________________________________________________*/

CREATE TABLE Tickets

(ticket_id INT NOT NULL,  
issue_type VARCHAR(50) NOT NULL,
priority INT NOT NULL,
CONSTRAINT unique_ticket_id PRIMARY KEY (ticket_id));


INSERT INTO Tickets
(ticket_id,issue_type,priority)

VALUES  (1,'Login Issue',1),
        (2,'Server Down',3),
        (3,'Slow System',2),
        (4,'Email Error',2),
        (5,'Passsword Reset',1);

-- Retrieve all rows from Tickets table
select * from `workspace`.`default`.`Tickets` limit 5;


select
        `issue_type`,
        `priority`,

Case 
when priority=3 then 'high'
when priority=2 then 'medium'
when priority=1 then 'low'
end priority_level
from `workspace`.`default`.`Tickets`;



/*_______________________________________________________________________________________________
  ATTENDANCE TABLE
 _________________________________________________________________________________________________*/

CREATE TABLE Attendance

(stud_ID INT NOT NULL,  
days_present INT NOT NULL,
total_days INT NOT NULL,
CONSTRAINT unique_stud_ID PRIMARY KEY (stud_ID));


INSERT INTO Attendance
(stud_ID,days_present,total_days)

VALUES  (1,45,50),
        (2,30,50),
        (3,48,50),
        (4,25,50),
        (5,50,50);

-- Retrieve all rows from Attendance table
select * from `workspace`.`default`.`Attendance` limit 5;


/*Calculate attendance % and classify: 
● ≥ 90% → 'Excellent' 
● 75–89% → 'Good' 
● < 75% → 'Needs Improvement' */


SELECT 
    stud_id,
    days_present,
    total_days,
    
    (days_present * 100.0 / total_days) AS attendance_percentage,

    Case 
    when attendance_percentage >= 90 then 'Excellent'
    when attendance_percentage between 75 and 89 then 'Good'
    when attendance_percentage < 75 then 'Needs Improvement'
    end attendance_status

FROM Attendance;



/*_______________________________________________________________________________________________
  PRODUCTS_INVENTORY
 _________________________________________________________________________________________________*/

CREATE TABLE Product_inventory

(prod_id INT NOT NULL,  
stock_qty INT NOT NULL,
CONSTRAINT unique_prod_id PRIMARY KEY (prod_id));


INSERT INTO Product_inventory
(prod_id,stock_qty)

VALUES  (1,5),
        (2,0),
        (3,25),
        (4,10),
        (5,3);

-- Retrieve all rows from PRODUCT_INVENTORY table
select * from `workspace`.`default`.`product_inventory` limit 5;


Select 
        `prod_id`,
        `stock_qty`,

Case
        when stock_qty=0 then 'out of stock'
        when stock_qty between 1 and 5 then 'low stock'
        when stock_qty >=5 then 'In stock'
        END stock_status

From `workspace`.`default`.`Product_inventory` 
Limit 5;




/*_______________________________________________________________________________________________
  Classes TABLE
 _________________________________________________________________________________________________*/

CREATE TABLE Classes

(class_id INT NOT NULL, 
subject VARCHAR(50) NOT NULL,
enrolled_students INT NOT NULL,
CONSTRAINT unique_class_id PRIMARY KEY (class_id));

INSERT INTO Classes
(class_id,subject,enrolled_students)

VALUES  (1,'Math',30),
        (2,'English',25),
        (3,'Science',15),
        (4,'Art',5),
        (5,'History',20);

-- Retrieve all rows from Classes table
select * from `workspace`.`default`.`Classes` limit 5;


Select 
        `subject`,
        `enrolled_students`,
Case

        When enrolled_students >= 25 then 'Large'
        When enrolled_students between 10 and 24 then 'Medium'
        When enrolled_students <10 then 'Small'
        END class_size_category
from `workspace`.`default`.`Classes`
Limit 5;




/*_______________________________________________________________________________________________
  PAYMENTS TABLE
 _________________________________________________________________________________________________*/

CREATE TABLE PAYMENTS

(payment_id INT NOT NULL, 
amount INT NOT NULL,
payment_method VARCHAR(50) NOT NULL,
CONSTRAINT unique_payment_id PRIMARY KEY (payment_id));

INSERT INTO Payments
(payment_id,amount,payment_method)

VALUES  (1,50,'Card'),
        (2,200,'Cash'),
        (3,150,'Card'),
        (4,75,'PayPal'),
        (5,300,'Cash');

-- Retrieve all rows from Payments table
select * from `workspace`.`default`.`Payments` limit 5;


Select 
        `payment_id`
        `payment_method`,
        `amount`,

Case

        When payment_method = 'Cash' AND amount >= 200 then 'Eligible For Discount'
        Else 'Not Eligible'
        END discount_eligibility
from `workspace`.`default`.`Payments`
Limit 5;
