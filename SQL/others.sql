
-- GROUP BY
-- this example works a bit like the DISTINCT clause where it removes duplicates

SELECT hobby FROM people GROUP BY hobby;

-- becomes more useful when used with an aggregate func like SUM or COUNT

CREATE TABLE payments (id INTEGER PRIMARY KEY, customer_id INTEGER, amount INTEGER);


INSERT INTO payments VALUES (1, 1, 20);
INSERT INTO payments VALUES (2, 1, 45);
INSERT INTO payments VALUES (3, 2, 5);
INSERT INTO payments VALUES (4,  2, 63);
INSERT INTO payments VALUES (5,  3, 13);
INSERT INTO payments VALUES (6,  3, 27);
INSERT INTO payments VALUES (7,  3, 5);
INSERT INTO payments VALUES (8,  4, 8);
INSERT INTO payments VALUES (9,  4, 34);
INSERT INTO payments VALUES (10,  4, 27);

SELECT * FROM payments;
-- adds all the payments that relate to each customer 
SELECT customer_id, SUM(amount) sums FROM payments GROUP BY customer_id ORDER BY sums;


-- UNION 
-- The UNION operator combines result sets of two or more SELECT statements into a single result set.
-- i.e. combines tables 
-- The number and the order of the columns in the select list of both queries must be the same.
-- The data types must be compatible.
-- To retain duplicate rows, you use the the UNION ALL.


-- SUBQUERY
-- A subquery is a query nested inside another query - placed in brackets

