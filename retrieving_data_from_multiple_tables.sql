USE sql_store;
-- Using INNER JOIN 
-- SELECT * FROM orders JOIN customers ON orders.customer_id = customers.customer_id;
-- SELECT order_id, first_name, last_name FROM orders JOIN customers ON orders.customer_id = customers.customer_id;

-- SELECT order_id, orders.customer_id, first_name, last_name 
-- 	FROM orders 
-- 	JOIN customers 
--     ON orders.customer_id = customers.customer_id; -- If you don't specify the table, sql will throw an error that it is ambigous 

-- SELECT order_id, o.customer_id, first_name, last_name 
-- 	FROM orders o
-- 	JOIN customers c
--     ON o.customer_id = c.customer_id; -- Making our code simpler 



-- Exercise 
-- SELECT p.product_id, quantity, o.unit_price, name 
-- 	FROM order_items o 
--     JOIN products p 
--     ON o.product_id = p.product_id;



-- Joining accross database 
-- SELECT  p.product_id, quantity, oi.unit_price, name  
-- 	FROM order_items oi 
-- 	JOIN sql_inventory.products p 
--     ON oi.product_id = p.product_id;


-- Self joining 
-- USE sql_hr;
-- SELECT e.employee_id, e.first_name, m.first_name AS employer FROM employees e 
-- 	JOIN employees m 
--     WHERE e.reports_to = m.employee_id;

-- Joining more than two tables 
-- SELECT o.order_id, 
-- 	o.order_date, 
-- 	c.first_name,
--     c.last_name,
--     os.name AS status
-- 	FROM orders o
-- 	JOIN customers c
--     ON o.customer_id = c.customer_id
--     JOIN order_statuses os
--     ON o.status = os.order_status_id;


-- Exercise 
-- USE sql_invoicing;
-- SELECT 
-- 	p.payment_id, 
--     c.name, 
--     p.date, 
--     p.amount, 
--     pm.name AS payment_method 
-- FROM clients c
-- 	JOIN payments p
--     ON p.client_id = c.client_id
--     JOIN payment_methods pm
--     ON pm.payment_method_id = p.payment_method;


-- Using compounding join coditions 
-- SELECT * FROM 
-- 	order_items oi
--     JOIN order_item_notes oin
--     ON oi.order_id = oin.order_id
--     AND oi.product_id = oin.product_id;


-- Implicit Join Syntax. All the above syntax are explicit syntax
-- SELECT * FROM orders o, customers c
-- 	WHERE o.customer_id = c.customer_id;

-- Outer JOIN (You don't have to put the OUTER key word there). By defuat if you put LEFT or RIGHT there, it will be OUTER JOIN
-- SELECT c.customer_id, c.first_name, o.order_id FROM orders o
-- 	RIGHT JOIN customers c
--     ON c.customer_id = o.customer_id;



-- Exercise
-- USE sql_store;
--  SELECT p.product_id, p.name, p.unit_price, oi.order_id 
-- 	FROM order_items oi
-- 	RIGHT JOIN products p
-- 	ON oi.product_id = p.product_id;


-- Outer JOIN with multiple tables 
-- USE sql_store;
-- SELECT c.customer_id, c.first_name, o.order_id, o.shipper_id, s.name 
-- 	FROM customers c
-- 	LEFT JOIN orders o
--     ON c.customer_id = o.customer_id
--     LEFT JOIN shippers s
--     ON o.shipper_id = s.shipper_id
--         ORDER BY c.customer_id;



-- Exercise 
-- USE sql_store;
--  SELECT o.order_id, o.order_date, c.first_name, s.shipper_id, s.name shipper, os.name status_name
-- 	FROM orders o
-- 	LEFT JOIN shippers s
-- 	ON o.shipper_id = s.shipper_id
--     LEFT JOIN customers c
--     ON o.customer_id = c.customer_id
--     LEFT JOIN order_statuses os
--     ON os.order_status_id = o.status;


-- Outer Self JOIN 
-- USE sql_hr;
-- SELECT e.employee_id, e.first_name, e.reports_to, m.first_name manager FROM employees e
-- 	LEFT JOIN employees m
--     ON e.reports_to = m.employee_id;
    

-- Using USING clause. USING is used instead of ON if the column name is the same in the two tables
-- USE sql_store;    
-- SELECT o.order_id, c.first_name, s.name shipper_name
--  FROM orders o
-- 	JOIN customers c
--     USING(customer_id)
--     LEFT JOIN shippers s
--     USING (shipper_id);

-- Using USING and AND
-- USE sql_store;    
-- SELECT * FROM order_items oi
-- 	JOIN order_item_notes oin
--     USING (order_id, product_id);

-- Exercise 
-- USE sql_invoicing;
-- SELECT 
-- p.payment_id,
-- p.date,
-- p.amount,
-- c.name,
-- pm.name
--  FROM payments p
-- 	JOIN clients c
--     USING(client_id)
--      JOIN payment_methods pm
--     ON pm.payment_method_id = p.payment_method


-- Using NATURAL JOIN (But it's not recommended 
-- SELECT 
	-- o.order_id, c.first_name	
-- 	FROM orders o
-- 	NATURAL JOIN customers c;


-- CROSS JOIN  (This is called explicit syntax for CROSS JOIN)
-- SELECT 
-- 	c.first_name customers,
--     p.name product
-- 	FROM customers c
--     CROSS JOIN products p
--     ORDER BY c.first_name;

-- Implicit synthax for CROSS JOIN
-- SELECT 
-- 	c.first_name customers,
--     p.name product
-- 	FROM customers c, products p
--     ORDER BY c.first_name; 
    

-- Exercise (Using CROSS JOIN implicitly)
-- USE sql_store;
-- SELECT 
-- 	p.product_id,
-- 	p.name,
-- 	s.shipper_id,
-- 	s.name
--  FROM 
-- 	products p, shippers s;

-- (using CROSS JOIN explicitly)
-- USE sql_store;
-- SELECT 
-- 	p.product_id,
-- 	p.name,
-- 	s.shipper_id,
-- 	s.name
--  FROM 
-- 	products p
-- 	CROSS JOIN shippers s;


-- Union 
-- SELECT 
-- order_id,
-- order_date,
-- 'Active' status 
--  FROM orders o
-- 	WHERE o.order_date >= '2019-01-01'
-- UNION
-- SELECT 
-- order_id,
-- order_date,
-- 'Archived' status 
--  FROM orders o
-- 	WHERE o.order_date <  '2019-01-01';


-- Exercises 
-- SELECT c.customer_id, c.first_name, c.points, 'Bronze' type FROM customers c WHERE c.points < 2000
-- UNION 
-- SELECT c.customer_id, c.first_name, c.points, 'Silver' type FROM customers c 
-- 	WHERE c.points BETWEEN 2000 AND 3000  -- c.points >= 2000 AND c.points < 3000
-- UNION 
-- SELECT c.customer_id, c.first_name, c.points, 'Gold' type FROM customers c WHERE c.points < 2000
-- 	ORDER BY first_name





 