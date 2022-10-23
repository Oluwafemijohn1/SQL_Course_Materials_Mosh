USE sql_invoicing;
-- Aggregate Functions
-- This MAX and MIN can be applied to number
-- SELECT 
-- 	MAX(invoice_total) AS highest,
--     MIN(invoice_total) AS lowest,
--     AVG(invoice_total) AS average,
--     SUM(invoice_total) AS total,
--     COUNT(invoice_total) AS number_of_invoices,
--     COUNT(payment_date) AS count_of_payment, -- These functions only work on the not null values i.e the null fields will 
--     -- not be included 
--     COUNT(*) AS total_record, -- to get the total record in the table
--     COUNT(DISTINCT client_id ) AS distinct_total_record, -- getting count that has distinct attribute
--     SUM(invoice_total * 1.1) AS multiplied_with_expression
-- FROM invoices
-- -- With filter conditions
-- WHERE invoice_date > '2019-07-01'


-- Also, it can be applied to date 
-- SELECT 
-- 	MAX(payment_date) AS highest,
--     MIN(payment_date) AS lowest
-- FROM invoices;




-- Exercise 
-- SELECT 
-- 	'First half of 2019' AS date,
--     SUM(invoice_total) AS total_sales,
--     SUM(payment_total) AS total_payments,
--     SUM(invoice_total - payment_total) AS what_we_expect
-- FROM invoices	
-- WHERE invoice_date
-- 	BETWEEN '2019-01-01'  AND '2019-06-30'
-- UNION 
-- SELECT 
-- 	'Second half of 2019' AS date,
--     SUM(invoice_total) AS total_sales,
--     SUM(payment_total) AS total_payments,
--     SUM(invoice_total - payment_total) AS what_we_expect
-- FROM invoices	
-- WHERE invoice_date
-- 	BETWEEN '2019-07-01'  AND '2019-12-31'
-- UNION 
-- SELECT 
-- 	'Total' AS date,
--     SUM(invoice_total) AS total_sales,
--     SUM(payment_total) AS total_payments,
--     SUM(invoice_total - payment_total) AS what_we_expect
-- FROM invoices	
-- WHERE invoice_date
-- 	BETWEEN '2019-01-01'  AND '2019-12-31';


-- Group by clause
-- SELECT 
-- 	client_id,
-- 	SUM(invoice_total) AS total_sales
-- FROM invoices 
-- 	GROUP BY client_id
--     ORDER BY total_sales DESC;


-- Group by clause and including filter
-- SELECT 
-- 	client_id,
-- 	SUM(invoice_total) AS total_sales
-- FROM invoices 
-- WHERE invoice_date >= '2019-07-01'
-- 	GROUP BY client_id
--     ORDER BY total_sales DESC;


-- Grouping by multiple column
-- SELECT 
-- 	state,
--     city,
--     SUM(invoice_total) AS total_sales
-- FROM invoices
-- JOIN clients USING(client_id)
-- 	GROUP BY state, city;



-- Exercise 
-- SELECT 
-- 	p.date,
--     pm.name,
--     SUM(p.amount) AS total_payments
-- FROM payments p
-- JOIN payment_methods pm
-- 	ON pm.payment_method_id = p.payment_method
-- 	GROUP BY p.date, pm.name
--     ORDER BY total_payments DESC;


-- Using HAVING to group data (HAVING is used to filter DATA after grouping it becuase we can not use WHERE)
-- SELECT 
-- 	client_id,
--     SUM(invoice_total) AS total_sales,
--     COUNT(*) AS number_of_invoices
-- FROM invoices
-- GROUP BY client_id
-- HAVING total_sales > 500 AND number_of_invoices > 5; -- the columns used here must be part of our SELECT clause unlike WHERE 



-- Exercise
-- USE sql_store;
-- SELECT
-- 	c.customer_id,
--     c.first_name,
--     c.last_name,
--     SUM(oi.quantity * oi.unit_price) AS total_sales
-- FROM customers c
-- JOIN orders o USING (customer_id)
-- JOIN order_items oi USING (order_id)
-- WHERE state = 'VA'
-- GROUP BY 
-- 	c.customer_id,
--     c.first_name,
--     c.last_name
-- HAVING total_sales > 100;


-- The ROLLUP operator ( but it is only avialable in mysql) 
-- SELECT 
-- 	state,
--     city,
--     SUM(invoice_total) AS total_sales
-- FROM invoices 
-- JOIN clients c USING(client_id)
-- GROUP BY state, city WITH ROLLUP



-- Exercise
-- USE sql_invoicing;
-- SELECT 
-- 	pm.name AS payment_method,
--     SUM(amount) AS total
-- 	FROM payments p
--     JOIN payment_methods pm ON pm.payment_method_id = p.payment_method
--     GROUP BY pm.name WITH ROLLUP;










