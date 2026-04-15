--Table Overview

SELECT * FROM `practical-3-493417.001.retail_sales` LIMIT 1000;

-- Filter all transactions that occurred in the year 2023.

SELECT* 
FROM `practical-3-493417.001.retail_sales` 
WHERE EXTRACT(YEAR FROM Date) = 2023
LIMIT 1000;

-- Display all transactions where the Total Amount is more than the average Total Amount of the entire dataset.


SELECT *
FROM `practical-3-493417.001.retail_sales` 
WHERE `Total Amount` > (
    SELECT AVG(`Total Amount`)
    FROM `practical-3-493417.001.retail_sales`);


-- Calculate the total revenue (sum of Total Amount).
SELECT
SUM(`Total Amount`) Total_Revenue
FROM `practical-3-493417.001.retail_sales`;

-- Display all distinct Product Categories in the dataset.
SELECT 
  DISTINCT (`Product Category`)

FROM `practical-3-493417.001.retail_sales`;

-- For each Product Category, calculate the total quantity sold

SELECT
`Product Category`,
SUM(quantity) Total_Quantity
FROM `practical-3-493417.001.retail_sales`
GROUP BY ALL;

/* Create a column called Age_Group that classifies customers as:
– 'Youth' (<30)     – 'Adult' (30–59)     – 'Senior' (60+)*/

SELECT 
      `Customer ID`, 
      Age,
    CASE 
        WHEN Age <30 THEN 'Youth'
        WHEN Age BETWEEN 30 AND 59 THEN 'Adult'
        ELSE 'Senior'
    END AS Age_Group
  FROM `practical-3-493417.001.retail_sales`;

  -- For each Gender, count how many high-value transactions occurred (where Total Amount > 500).Expected Output: Gender, High_Value_Transactions

SELECT
      Gender,
      COUNT(`Total Amount`) High_value
FROM `practical-3-493417.001.retail_sales`
WHERE `Total Amount`> 500
Group BY ALL;


-- For each Product Category, show only those categories where the total revenue exceeds 5,000.Expected Output: Product_Category, Total_Revenue

SELECT
      `Product Category`,
      SUM(`Total Amount`) Total_Revenue
FROM `practical-3-493417.001.retail_sales`
GROUP BY ALL 
HAVING Total_Revenue > 5000;
 



-- Display a new column called Unit_Cost_Category that labels a transaction as:

SELECT 
      `Transaction ID`, 
      `Price per Unit`,

CASE 
    WHEN `Price per Unit` < 50 THEN 'Cheap'
    WHEN `Price per Unit` BETWEEN 50 AND 200 THEN 'Moderate'
    ELSE 'Expensive'
  END Unit_Cost_Category
FROM `practical-3-493417.001.retail_sales`;

-- Display all transactions from customers aged 40 or older and add a column Spending_Level

SELECT 
      `Customer ID`,
       Age, 
       `Total Amount`,

CASE 
    WHEN `Total Amount` >1000 THEN 'High'
    ELSE 'Low'
  END  Spending_Level

FROM `practical-3-493417.001.retail_sales`
WHERE Age >=40;

