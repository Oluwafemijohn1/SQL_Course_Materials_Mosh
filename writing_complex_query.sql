-- A Sub query is a SELECT statement in another sql statement 

-- USE sql_store;
-- SELECT * FROM products WHERE unit_price > (
-- 	SELECT unit_price FROM products WHERE product_id =3
-- )

-- Exercise 
-- USE sql_hr;
-- SELECT * FROM employees WHERE salary > (
-- 	SELECT AVG(salary) FROM employees 
-- )



-- The IN operator
-- USE sql_store;
-- SELECT * FROM products WHERE product_id NOT IN (
-- 	SELECT DISTINCT product_id FROM order_items
-- )


-- Exercise 
-- USE sql_invoicing;
-- SELECT * FROM clients WHERE client_id NOT IN (
-- 	SELECT DISTINCT client_id FROM invoices
--     );


-- USE sql_invoicing;
-- SELECT * FROM clients WHERE client_id NOT IN (
-- 	SELECT DISTINCT client_id FROM invoices
--     );


-- SELECT * FROM clients 
-- LEFT JOIN invoices USING (client_id)
-- WHERE invoice_id IS NULL


-- Exercise using sub query
-- USE sql_store; 
-- SELECT * FROM customers 
-- WHERE customer_id IN (
-- 	SElECT o.customer_id FROM 
--     order_items oi
--     JOIN orders o USING (order_id)
--     WHERE product_id = 3
-- );


-- Exercise using JOIN
-- USE sql_store; 
-- SELECT DISTINCT c.customer_id, c.first_name, c.last_name  FROM customers c
-- JOIN orders o USING (customer_id)
-- JOIN order_items oi USING (order_id)
-- WHERE oi.product_id = 3;


-- The ALL keyword example
-- Select invoices larger than all invoices of client 3
-- USE sql_invoicing;
-- SELECT * FROM invoices WHERE invoice_total > (
-- 	SELECT MAX(invoice_total) FROM invoices WHERE client_id = 3
-- )


-- The ALL keyword 
-- USE sql_invoicing;
-- SELECT * FROM invoices WHERE invoice_total > ALL (
-- 	SELECT invoice_total FROM invoices WHERE client_id = 3
-- );


-- ANY keyword
-- USE sql_invoicing;
-- SELECT * FROM clients 
-- 	WHERE client_id IN (
-- 		SELECT client_id
-- 		FROM invoices 
-- 		GROUP BY client_id 
-- 		HAVING COUNT(*) >= 2
--     );
    
-- Using ANY keyword 
-- USE sql_invoicing;
-- SELECT * FROM clients 
-- 	WHERE client_id = ANY (
-- 		SELECT client_id
-- 		FROM invoices 
-- 		GROUP BY client_id 
-- 		HAVING COUNT(*) >= 2
--     );



-- Correlated Subqueries ( becuase in the subquery we are making reference to the alias from outer query )
-- The sub query get executed for each row in the query
-- This can sometimes be slow. The more data we have, the more overhead your query is going to have.

-- USE sql_hr;
-- SELECT * FROM employees e WHERE salary > (
-- 	SELECT AVG(salary) FROM employees WHERE office_id = e.office_id
-- )


-- Exercise
-- USE sql_invoicing;
-- SELECT * FROM invoices i
-- WHERE invoice_total > (
-- 	SELECT AVG(invoice_total)
--     FROM invoices WHERE client_id = i.client_id
-- )



-- Prob:  SELECT client that have invoices 
-- Exists OPERATOR

-- 1. other ways to solve the same challenge
-- USE sql_invoicing;
-- SELECT * FROM clients WHERE client_id IN (
-- 	SELECT DISTINCT client_id FROM invoices 
-- );

-- 2. using EXISTS
-- USE sql_invoicing;
-- SELECT * FROM clients c
-- WHERE EXISTS (
-- 	SELECT client_id
--     FROM invoices 
--     WHERE client_id = c.client_id
-- );

-- Exercise
-- USE sql_store;
-- SELECT * FROM products p
-- WHERE NOT EXISTS (
-- 	SELECT product_id
--     FROM order_items
--     WHERE product_id = p.product_id
-- );


-- Sub queries in the SELECT clause
-- USE sql_invoicing; 
-- SELECT invoice_id, invoice_total,
-- 		(SELECT AVG(invoice_total) FROM invoices ) AS invoice_average,
--         invoice_total - (SELECT invoice_average) differrence 
-- 	FROM invoices;


-- Exercise
-- USE sql_invoicing;
-- SELECT 
-- 	client_id,
--     name,
--     (SELECT SUM(invoice_total) FROM invoices i WHERE c.client_id = i.client_id  ) AS total_sales,
--     (SELECT AVG(invoice_total) FROM invoices ) AS average,
--     -- (SELECT total_sales) - (SELECT average) AS difference
--         (SELECT total_sales - average) AS difference
--   FROM clients c;


-- Using subqueries in FROM clause
-- USE sql_invoicing;
-- SELECT * FROM (
-- 	SELECT 
-- 		client_id,
-- 		name,
-- 		(SELECT SUM(invoice_total) FROM invoices i WHERE c.client_id = i.client_id  ) AS total_sales,
-- 		(SELECT AVG(invoice_total) FROM invoices ) AS average,
-- 		(SELECT total_sales - average) AS difference
-- 	  FROM clients c
-- ) AS sales_summary;


-- Using subqueries in FROM clause and filtering it 
USE sql_invoicing;
SELECT * FROM (
	SELECT 
		client_id,
		name,
		(SELECT SUM(invoice_total) FROM invoices i WHERE c.client_id = i.client_id  ) AS total_sales,
		(SELECT AVG(invoice_total) FROM invoices ) AS average,
		(SELECT total_sales - average) AS difference
	  FROM clients c
) AS sales_summary WHERE total_sales IS NOT NULL;
