---Creating a table DATA DEFINITION LANGUAGE
CREATE TABLE Orders

(order_id INT NOT NULL, 
customer_name VARCHAR (50) NOT NULL, 
amount  INT NOT NULL,
CONSTRAINT unique_order_id PRIMARY KEY (order_id));


-- INSERT VALUES INTO PRODUCT TABLE

INSERT INTO Orders
(order_id,customer_name,amount)

VALUES  (1,'Alice',150.00),
        (2,'Bob',560.00),
        (3,'Charlie',999.99),
        (4,'Diana',45.50),
        (5,'Ethan',1200.00);

-- Retrieve all rows from PRODUCT table
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


      
