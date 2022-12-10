
-- Numeric Functions

-- SELECT ROUND(5.73) -- 6
-- SELECT ROUND(5.73, 1) -- 5.7
-- SELECT ROUND(5.7345, 2) -- 5.73
-- SELECT ROUND(5.7355, 2) -- 5.74 , this will round off 

-- SELECT TRUNCATE(5.7355, 2) -- 5.73, this will not round off

-- SELECT CEILING(5.7) -- 6 
-- SELECT CEILING(5.01) -- 6
-- SELECT CEILING(5.0) -- 5

-- SELECT FLOOR(5.7) -- 5
-- SELECT FLOOR(5.01); -- 5
-- SELECT FLOOR(5.0) -- 5

-- SELECT ABS(5.2); -- 5.2
-- SELECT ABS(-5.2) -- 5.2

-- SELECT RAND() random numbers








-- <<<<<String funtions>>>>
-- SELECT LENGTH('sky');
-- SELECT UPPER('Hello');
-- SELECT LOWER('Hello');

-- SELECT LTRIM('  hello');
-- SELECT RTRIM('hello  ');
-- SELECT TRIM('  hello  ');
-- SELECT LEFT('kindergarteen', 4);
-- SELECT RIGHT('kindergarteen', 6) -- arteen
-- SELECT SUBSTRING('kindergarteen', 3, 5) -- nderg
-- SELECT LOCATE('n', 'kindergarteen') -- 3 position of the first letter
-- SELECT REPLACE('kindergarteen', 'garteen', 'garden'); 
-- SELECT CONCAT('first','last');


-- USE sql_store;
-- SELECT CONCAT(first_name, " ", last_name) AS full_name FROM customers







-- Date funtions 
-- SELECT NOW(), CURDATE(), CURTIME();
-- SELECT YEAR(NOW()) -- returns year 
-- SELECT MONTH(NOW()) -- returns month
-- SELECT HOUR(NOW());
-- SELECT DAY(NOW());
-- SELECT MINUTE(NOW());
-- SELECT SECOND(NOW());
-- SELECT DAYNAME(NOW())
-- SELECT MONTHNAME(NOW());
-- SELECT EXTRACT(DAY FROM NOW());
-- SELECT YEARWEEK(NOW());
-- SELECT WEEKOFYEAR(NOW())



-- From the previous exercises 
-- SELECT * FROM orders WHERE YEAR(order_date) >= YEAR(NOW())



-- Formating Dates and Times
-- SELECT DATE_FORMAT(NOW(), '%y'); -- 22 as year
-- SELECT DATE_FORMAT(NOW(), '%Y'); -- 2022
-- SELECT DATE_FORMAT(NOW(), '%m %Y'); -- 10 2022
-- SELECT DATE_FORMAT(NOW(), '%M %Y'); -- October 2022
-- SELECT DATE_FORMAT(NOW(), '%M %d %Y'); -- October 26 2022
-- SELECT DATE_FORMAT(NOW(), '%M %D %Y'); -- October 26th 2022
-- SELECT DATE_FORMAT(NOW(), '%m-%d-%Y');  -- 10-26-2022


-- SELECT TIME_FORMAT(NOW(), '%h:%i'); -- 08:22
-- SELECT TIME_FORMAT(NOW(), '%H:%i'); -- 20:22
-- SELECT TIME_FORMAT(NOW(), '%H:%i %p'); -- 20:24 PM


-- Calculating date and time 
-- SELECT DATE_ADD(NOW(), INTERVAL 1 DAY) -- 2022-10-27 21:36:43 added 1 day to current date time
 -- SELECT DATE_ADD(NOW(), INTERVAL 1 YEAR) -- 2023-10-26 21:37:49
 -- SELECT DATE_ADD(NOW(), INTERVAL -1 YEAR) -- 2021-10-26 21:38:43 removed one year from current date time  
 -- Or
-- SELECT DATE_SUB(NOW(), INTERVAL 1 YEAR) -- 2021-10-26 21:40:01 same as the above 


-- Date diff 
-- SELECT DATEDIFF('2019-01-05', '2019-01-01') -- 4 days, it only returns values in days. also, the later day first
-- SELECT DATEDIFF('2019-01-05 09:00', '2019-01-01 17:00'); -- 4 days
-- SELECT TIME_TO_SEC('09:02') - TIME_TO_SEC('09:00') 




-- The IFNULL and COALESCE Functions
--  IFNUL
-- USE sql_store;
-- SELECT 
-- 	order_id, 
--     IFNULL(shipper_id, 'Not Assigned') AS shipper
--     FROM orders


-- USE sql_store;
-- COALESCE Functions
-- SELECT 
-- 	order_id, 
--     COALESCE(shipper_id, comments, 'Not Assigned') AS shipper
--     FROM orders


-- Exercise
-- SELECT 
-- 	CONCAT(first_name, " ", last_name) AS full_name,
--     IFNULL(phone, 'Unknown') AS phone
--     FROM customers

-- The IF Function
-- USE sql_store;
-- SELECT 
-- 	order_id, 
--     order_date,
--     IF(
-- 		YEAR(order_date) = YEAR(NOW()),
--         'Active',
--         'Achive'
--     ) AS category
-- FROM orders


-- Exercise
-- USE sql_store;
-- SELECT 
-- 	p.product_id, p.name, 
--     COUNT(*) AS orders, 
--     IF(COUNT(*) > 1, 'Many times', 'Once') AS frequency
-- FROM products p 
-- JOIN order_items USING(product_id) 
-- GROUP BY product_id, name;


-- The CASE operator
-- USE sql_store;
-- SELECT 
-- 	order_id,
--     CASE
-- 		WHEN YEAR(order_date) = YEAR(NOW()) THEN 'Active' 
--         WHEN YEAR(order_date) = YEAR(NOW() -1 ) THEN 'Last year'
--         WHEN YEAR(order_date) < YEAR(NOW() -1) THEN 'Achive'
--         ELSE 'Future'
-- 	END AS category
-- FROM orders

-- EXERCISE
USE sql_store;
SELECT 
	CONCAT(first_name, " ", last_name) AS full_name,
    points,
    CASE
		WHEN points > 3000 THEN 'GOLD'
        WHEN points > 2000 THEN 'SILVER'
        ELSE 'BRONZE'
	END AS category
FROM customers
ORDER BY points DESC


    


