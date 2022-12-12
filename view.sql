
/*
Creating Viewa
*/

-- USE sql_invoicing;
-- CREATE VIEW sales_by_client AS
-- SELECT 
-- 	c.client_id,
--     c.name,
--     SUM(invoice_total) AS total_sales
-- FROM clients c 
-- JOIN invoices i USING(client_id)
-- GROUP BY client_id, name;


/*
Working with view
*/
-- Selecting and ordering
-- SELECT * 
-- FROM sales_by_client 
-- ORDER BY total_sales
-- DESC;

-- Filtering view
-- SELECT * 
-- FROM sales_by_client 
-- WHERE total_sales > 500


-- Joining View with other Tables
-- SELECT * 
-- FROM sales_by_client 
-- JOIN clients USING(client_id);

-- Exercise
CREATE VIEW clients_balance AS 
SELECT 
	c.client_id,
    c.name,
    SUM(invoice_total - payment_total) AS balance
FROM clients c
JOIN invoices i USING(client_id)
GROUP BY client_id, name;
