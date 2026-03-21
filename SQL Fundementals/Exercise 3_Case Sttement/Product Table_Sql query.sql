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
--Classify each product by price:
----'Expensive' if price > 1000
----'Mid-range' if price between 100 and 1000
-----'Budget' if price < 100

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


      
