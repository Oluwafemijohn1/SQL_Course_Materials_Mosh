-- USE sql_store;

-- NOTE: the order of single table SQL is -> SELECT, FROM, WHERE, ORDER, LIMIT


-- SELECT * FROM customers;


-- SELECT * 
-- FROM customers 
-- WHERE customer_id = 2
-- ORDER BY first_name;

-- SELECT 
-- 	first_name, 
--     last_name, 
--     points, (points + 10 ) * 
--     -- Using alias
--     10 AS discount_factor -- if you want space in between use qoute around the name
-- FROM customers;

-- SELECT DISTINCT state FROM customers; 

-- SELECT name, unit_price, (unit_price * 1.1) AS new_price FROM products;

-- SELECT * FROM customers WHERE points > 3000;
-- not equal operators are >, <, <=, >=, != <>;

-- Selecting states that are not in varginia 
-- SELECT * FROM customers WHERE state != "VA"; -- the string is not case sensitive 
-- or
-- SELECT * FROM customers WHERE state <> "va";

-- Selecting birth_date
-- SELECT * FROM customers WHERE birth_date > "1990-01-01";

-- Ordera that are placed this year 
-- SELECT * FROM orders WHERE order_date > "2019-01-01" AND order_date < "2020-01-01";


-- Logical operators AND and OR
-- SELECT * FROM customers WHERE birth_date > "1990-01-01" OR points > 1000 AND state = "VA";

-- Not operator
-- SELECT * FROM customers WHERE NOT (birth_date > "1990-01-01" OR points > 1000 AND state = "VA");

-- The above is also the same as 
-- SELECT * FROM customers WHERE  birth_date <= "1990-01-01" AND points <= 1000;

-- SELECT * FROM order_items WHERE order_id = 6 AND unit_price * quantity > 30;

-- Using IN 
-- SELECT * FROM customers WHERE state IN ("VA", "FL", "GA");

-- Usin NOT IN
-- SELECT * FROM customers WHERE state NOT IN ("VA", "FL", "GA");

-- Exercises 
-- SELECT * FROM products WHERE quantity_in_stock IN (49, 38, 72);

-- Using BETWEEN 
-- SELECT * FROM customers WHERE points <=3000 AND points >= 1000; -- This can be written as 
-- SELECT * FROM customers WHERE points BETWEEN 1000 AND 3000;

-- Exercise
-- SELECT * FROM customers WHERE birth_date BETWEEN "1990-01-01" AND "2000-01-01";

-- Using LIKE
-- SELECT * FROM customers WHERE last_name LIKE "b%";

--  the '%' means any kind of character before the 'b' and any kind of character after 'b'
-- SELECT * FROM customers WHERE last_name LIKE "%b%";

-- also '_' which means one character before the letter. there is no result because there is no name with two characters 
-- SELECT * FROM customers WHERE last_name LIKE '_y';

-- For six xters "_____y"
-- SELECT * FROM customers WHERE last_name LIKE '_____y';

-- first xter with b and last xter with y
-- SELECT * FROM customers WHERE last_name LIKE 'b____y';

-- We use % to reprense any number of xters and _ to represent single xter

-- SELECT * FROM customers WHERE state NOT IN ("VA", "FL", "GA");

-- Exercise 
-- SELECT * FROM customers WHERE address LIKE '%TRAIL%' OR address LIKE '%AVENUE%';
-- SELECT * FROM customers WHERE phone LIKE "%9";


-- Using REGEXP
-- SELECT * FROM customers WHERE last_name REGEXP 'field'; -- This works like (last_name LIKE '%field%')
-- SELECT * FROM customers WHERE last_name REGEXP '^field'; -- meaning last_name start with field (i.e any xters at the end of the name)
-- SELECT * FROM customers WHERE last_name REGEXP 'field$'; -- meaning last_name ends with field (i.e any xters at the beginning of the name)
-- SELECT * FROM customers WHERE last_name REGEXP 'field|mac'; -- has field or mac in their name 
-- SELECT * FROM customers WHERE last_name REGEXP 'field|mac|rose'; has field or mac or rose
-- SELECT * FROM customers WHERE last_name REGEXP '^field|mac|rose'; 
-- SELECT * FROM customers WHERE last_name REGEXP 'field$|mac|rose'; 
-- SELECT * FROM customers WHERE last_name REGEXP '[igm]e'; -- looking for names like ie, ge, or me
-- SELECT * FROM customers WHERE last_name REGEXP '[a-h]e'; -- range of xters from a to h before e

-- Exercise 
SELECT * FROM customers WHERE first_name REGEXP 'ELKA|AMBUR';
-- SELECT * FROM customers WHERE last_name REGEXP 'EY$|ON$';
-- SELECT * FROM customers WHERE last_name REGEXP '^MY|SE';
-- SELECT * FROM customers WHERE last_name REGEXP 'B[RU]';


-- Using IS NULL Operators 
-- SELECT * FROM customers WHERE phone IS NULL; -- customers without phone no
-- SELECT * FROM customers WHERE phone IS NOT NULL; only customers with phone 


-- Exercise 
-- SELECT * FROM orders WHERE shipper_id IS NULL;

-- Using ORDER BY
-- SELECT * FROM customers ORDER BY first_name;
-- SELECT * FROM customers ORDER BY state, first_name;
-- SELECT * FROM customers ORDER BY state DESC, first_name;
-- SELECT * FROM customers ORDER BY state DESC, first_name DESC;

-- Exercise 
-- SELECT *, quantity * unit_price AS total_price FROM order_items WHERE order_id = 2 ORDER BY quantity * unit_price DESC; 
-- SELECT *, quantity * unit_price AS total_price FROM order_items WHERE order_id = 2 ORDER BY total_price DESC; -- removed duplication


-- Using LIMIT 
-- SELECT * FROM customers LIMIT 3; -- Limit of 3
-- SELECT * FROM customers LIMIT 6, 3; -- Offset 6 and limit 3. THis is used for pagination 

-- Exercise 
-- SELECT * FROM customers ORDER BY points DESC LIMIT 3;

-- NOTE: the order of single table SQL is -> SELECT, FROM, WHERE, ORDER, LIMIT

