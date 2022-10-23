-- INSERT INTO customers VALUES (DEFUALT, "John", "Smith", "1990-01-01", null, "address", "city", "CA", DEFUALT)

-- Inserting into the table 
-- INSERT INTO customers (
-- 	first_name,
--     last_name,
--     birth_date,
--     address,
--     city,
--     state
-- 	) 
-- VALUES 
-- 	(
--     "John", 
--     "Smith", 
--     "1990-01-01", 
--     "address", 
--     "city", 
--     "CA"
--     );


-- Inserting multiple in one goal
-- INSERT INTO shippers (name) 
-- 	VALUES ('Shippers1'), ('Shippers2'), ('Shippers3');

-- Exercise 
-- INSERT INTO products (name, quantity_in_stock, unit_price) 
-- 	VALUES ("Femi-Ogundipe", 6, 2.6), ("Fadeke-Ogundipe", 7, 2.8), ("James-Ogundipe", 6, 2.6);

-- Inserting Hierarchical rows (order is the parent and order_items is);
-- INSERT INTO orders (customer_id, order_date, status)
-- 	VALUES (1, '2019-01-02', 1);
-- INSERT INTO order_items 
-- 	VALUES (LAST_INSERT_ID(), 1, 1, 2.95),
-- 			(LAST_INSERT_ID(), 2, 1, 3.95);



-- Creating a copy of a table 
-- CREATE TABLE orders_archived AS
-- -- This is a sub query of another squel statement.
-- 	SELECT * FROM orders;
    
-- INSERT INTO orders_archived
-- -- another example of sub query when inserting into another table
-- 	SELECT * FROM orders WHERE order_date < '2019-01-01';

-- My iwn testing 
-- CREATE TABLE orders_archived AS
-- -- This is a sub query of another squel statement.
-- 	SELECT * FROM orders WHERE order_date < '2019-01-01';

-- Exercise 
-- USE sql_invoicing;
-- CREATE TABLE invoices_archived 
-- 	SELECT 
--     i.invoice_id, 
--     i.number,
--     c.name,
--     i.invoice_total,
--     i.payment_total,
--     i.invoice_date,
--     i.due_date,
--     i.payment_date
--     FROM invoices i
-- 		JOIN clients c 
--         ON i.client_id = c.client_id AND i.payment_date IS NOT NULL;



-- updating table rows 
-- USE sql_invoicing;
-- UPDATE invoices SET payment_total = 10, payment_date = '2019-03-01' WHERE invoice_id = 1;

-- Updating with an expression 
-- USE sql_invoicing;
-- UPDATE invoices SET payment_total = invoice_total * 0.5, payment_date = due_date WHERE invoice_id = 3;

-- Updating multiple rows 
-- USE sql_invoicing;
-- UPDATE invoices SET payment_total = invoice_total * 0.5, payment_date = due_date WHERE client_id = 3;


-- Another way to update multiple rows 
-- USE sql_invoicing;
-- UPDATE invoices SET payment_total = invoice_total * 0.5, payment_date = due_date WHERE client_id IN (3, 4);


-- Exercise 
-- USE sql_store;
-- UPDATE customers c SET
--  points = c.points +  50
--  WHERE c.birth_date < '1990-01-01';


-- Updating using subqueries ( When we don't know the id of the user we want to update )
-- USE sql_invoicing;
-- UPDATE invoices 
-- 	SET 
-- 		payment_total = invoice_total * 0.5, 
--         payment_date = due_date 
-- 	WHERE 
-- 		client_id = (
-- 			SELECT client_id
--             FROM clients 
--             WHERE name = 'Myworks'
--         );



-- Updating using subqueries ( When we don't know the id of the user we want to update and the 
-- subquery returns multiple users )

-- USE sql_invoicing;
-- UPDATE invoices 
-- 	SET 
-- 		payment_total = invoice_total * 0.5, 
--         payment_date = due_date 
-- 	WHERE 
-- 		client_id IN (
-- 			SELECT client_id
--             FROM clients 
--             WHERE state IN ('CA', 'NY ')
--         );


-- Exercise
-- USE sql_store;
-- UPDATE orders 
-- 	SET comments = "Gold customers" 
--     WHERE 
-- 		customer_id IN 
-- 			(
-- 				SELECT customer_id 
--                 FROM customers 
--                 WHERE points > 3000
-- 			);


-- DELETING Data From DB (this has not working yet ooo )
-- USE sql_invoicing;
-- DELETE FROM invoices
-- 	WHERE client_id =  (SELECT * FROM clients WHERE name = "Myworks");


-- DELETE FROM orders WHERE order_id = 12
	

