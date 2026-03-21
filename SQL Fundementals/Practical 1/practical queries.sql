--------------------------------------------------------------------------------------------
-- 1. SELECT STATEMENT
--------------------------------------------------------------------------------------------

-- 1.1 Display all columns for all transactions. 
-- Expected output: All columns

SELECT * 
FROM `workspace`.`default`.`retail_sales` limit 100;


--1.2 Display only the Transaction ID, Date, and Customer ID for all records. 

SELECT 
            `TransactionID`, 
            `Date`, 
            `CustomerID` 
FROM `workspace`.`default`.`retail_sales` 
LIMIT 100;



------------------------------------------------------------------------------------------
-- 2. SELECT DISTINCT
------------------------------------------------------------------------------------------

-- 2.1 Display all the distinct product categories in the dataset. 

SELECT DISTINCT `Product Category` 
FROM `workspace`.`default`.`retail_sales`
LIMIT 100;

-- 2.2 Display all the distinct gender values in the dataset.
SELECT DISTINCT Gender 
FROM `workspace`.`default`.`retail_sales`
LIMIT 10;


---------------------------------------------------------------------------------------------
-- 3. WHERE CLAUSE
---------------------------------------------------------------------------------------------

-- 3.1 Display all transactions where the Age is greater than 40
SELECT * 
FROM `workspace`.`default`.`retail_sales` 
WHERE `Age` > 40
LIMIT 100;

-- 3.2 Display all transactions where the Price per Unit is between 100 and 500.

SELECT * 
FROM `workspace`.`default`.`retail_sales` 
WHERE `Price per Unit` BETWEEN 100 AND 500
LIMIT 100;

--3.3 Display all transactions where the Product Category is either 'Beauty' or Electronics. 
SELECT * 
FROM `workspace`.`default`.`retail_sales` 
WHERE `Product Category` IN ('Beauty', 'Electronics')
LIMIT 100;

--3.4 Display all transactions where the Product Category is not 'Clothing'.
SELECT * 
FROM `workspace`.`default`.`retail_sales` 
WHERE `Product Category` NOT IN ('Clothing')
LIMIT 100;
--brings results as the previous query


--3.5 Display all transactions where the Quantity is greater than or equal to 3
SELECT * 
FROM `workspace`.`default`.`retail_sales` 
WHERE Quantity >= 3
LIMIT 100;


------------------------------------------------------------------------------------------
-- 4. AGGREGATE Functions
-------------------------------------------------------------------------------------------

-- 4.1 Count the total number of transactions.
SELECT COUNT(*) AS Total_Transactions
FROM `workspace`.`default`.`retail_sales`
LIMIT 100;

-- 4.2 Find the average Age of customers.

SELECT
AVG(Age) AS Average_Age
FROM `workspace`.`default`.`retail_sales`
LIMIT 100;
 

-- 4.3 Find the total quantity of products sold. 
SELECT SUM(Quantity) Total_Quantity
FROM retail_sales;

-- 4.5 Find the maximum Total Amount spent in a single transaction. 

SELECT 
max(`Total Amount`)  AS Max_Total_Amount
FROM `workspace`.`default`.`retail_sales`;


--  4.6 Find the minimum Price per Unit in the dataset. 
SELECT MIN(`Price per Unit`) min_price_unit
FROM `workspace`.`default`.`retail_sales`;


------------------------------------------------------------------------------------------
-- 5. GROUP BY CLAUSE
------------------------------------------------------------------------------------------


-- 5.1 Find the number of transactions per Product Category. 
-- Expected output: Product Category, Transaction_Count 
SELECT
        `Product Category`,
COUNT(*) AS Transaction_Count
FROM `workspace`.`default`.`retail_sales`
GROUP BY `Product Category`
ORDER BY Transaction_Count DESC
LIMIT 100;


-- 5.2 Find the total revenue (Total Amount) per gender. 
-- Expected output: Gender, Total_Revenue

SELECT
        Gender,
SUM(`Total Amount`) AS Total_Revenue
FROM `workspace`.`default`.`retail_sales`
GROUP BY Gender
ORDER BY Total_Revenue DESC
LIMIT 100;

--- 5.3 Find the total Revenue per gender and Product Category

SELECT
        Gender,
        `Product Category`,
SUM(`Total Amount`) AS Total_Revenue
FROM `workspace`.`default`.`retail_sales`
GROUP BY Gender, `Product Category`
ORDER BY Total_Revenue DESC
LIMIT 100;

---5.4  Find the total Revenue per gender and Product Category Is Chlothing

SELECT
        Gender,
        `Product Category`,
SUM(`Total Amount`) AS Total_Revenue
FROM `workspace`.`default`.`retail_sales`
GROUP BY Gender, `Product Category`
HAVING `Product Category` = 'Clothing'
ORDER BY Total_Revenue DESC
LIMIT 100;


-- 5.5 Find the average Price per Unit per product category. 
-- Expected output: Product Category, Average_Price 

SELECT
        `Product Category`,
AVG(`Price per Unit`) AS Average_Price,
Round(AVG(`Price per Unit`),2) Rounded_avg_price
FROM `workspace`.`default`.`retail_sales`
GROUP BY  `Product Category`
ORDER BY average_price DESC;

-------------------------------------------------------------------------------------------
-- 6 HAVING CLAUSE
-------------------------------------------------------------------------------------------

-- 6.1 Find the total revenue per product category where the total revenue is greater than 10,000.
-- Expected output: Product Category, Total_Revenue

SELECT
        `Product Category`,
SUM(`Total Amount`) AS Total_Revenue
FROM `workspace`.`default`.`retail_sales`
GROUP BY `Product Category`
HAVING Total_Revenue > 10000
LIMIT 100;


--6.2 Find the average quantity per product category where the average is more than 2.
--Expected output: Product Category, Average_Quantity

SELECT
        `Product Category`,
AVG(Quantity) AS Average_Quantity
FROM `workspace`.`default`.`retail_sales`
GROUP BY `Product Category`
HAVING Average_Quantity > 2
LIMIT 100;


-------------------------------------------------------------------------------------------
--CASE Statement
-------------------------------------------------------------------------------------------
--7.1 Display a column called Spending_Level that shows 'High' if Total Amount > 1000, otherwise 'Low'.
-- Expected output: Transaction ID, Total Amount, Spending_Level

select 
`TransactionID`,
`Total Amount`,
CASE WHEN `Total Amount` > 1000 THEN 'High' ELSE 'Low' END AS Spending_Level
FROM `workspace`.`default`.`retail_sales`
LIMIT 100;

--7.2 Display a new column called Age_Group that labels customers as:
--'Youth' if Age < 30
--'Adult' if Age is between 30 and 59
--'Senior' if Age >= 60
-- Expected output: Customer ID, Age, Age_Group

select 
`CustomerID`, 
Age,
CASE 
        WHEN Age < 30 THEN 'Youth'
        WHEN Age BETWEEN 30 AND 59 THEN 'Adult'
        WHEN Age >= 60 THEN 'Senior'
        END AS Age_Group
FROM `workspace`.`default`.`retail_sales`
LIMIT 100;
