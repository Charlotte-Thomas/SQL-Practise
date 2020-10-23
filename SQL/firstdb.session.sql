-- SECTION 1 of postgreSQL tutorial

-- press cmd E E to run a selected highlight of code

SELECT * FROM people;

SELECT name FROM people WHERE age > 30;
SELECT name FROM people WHERE age > 30;

-- using || allows you to concatinate two column data types together
SELECT 
   name || ' ' || hobby as name_hobby,
   age
FROM 
   people;


-- using expressions with SELECT omits the FROM clause:
SELECT 5 * 3;

-- using the LENGTH function (to order by name len):
SELECT 
	name,
	LENGTH(name) len
FROM
	people
ORDER BY 
	len DESC;

-- NULLS FIRST & NULLS LAST 
INSERT INTO people VALUES(4, 'John', 28, null);
SELECT name, hobby from people ORDER BY hobby ASC NULLS FIRST;
SELECT name, hobby from people ORDER BY hobby DESC NULLS LAST;

-- The DISTINCT clause is used in the SELECT statement to remove duplicate rows from a result set.
-- keeps one row for each group of duplicates. 

INSERT INTO people VALUES(5, 'John', 56, 'poker');
INSERT INTO people VALUES(6, 'Bill', 56, 'poker');
INSERT INTO people VALUES(7, 'Jill', 70, 'poker');
SELECT DISTINCT name, hobby FROM people; 
-- only shows one John (last added) BUT shows both Bills because distict will evaluate both name and hobby columns as a pair

-- It is a good practice to always use the ORDER BY clause with the DISTINCT ON(expression) to make the result set predictable.


-- DISTINCT ON (specifies the column (first) to remove duplicates from only)
SELECT
   DISTINCT ON (hobby) hobby,
   name
FROM
   people
ORDER BY
   hobby,
   name;