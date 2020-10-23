-- SECTION 2
 -- WHERE
-- The WHERE condition must evaluate to true, false, or unknown.
-- It can be a boolean expression or a combination of boolean expressions using the AND and OR operators.

SELECT *
FROM people
WHERE age > 50
  OR age = 23;

-- LIMIT CLAUSE
-- Typically, you often use the LIMIT clause to select rows with the highest or lowest values from a table.

SELECT id,
       name,
       age,
       hobby
FROM people
ORDER BY id
LIMIT 3
OFFSET 2; -- Will skip first 2 id's

-- FETCH
-- The LIMIT clause is not a SQL-standard, so can instead use FETCH
-- Note that the OFFSET clause must come before the FETCH clause in SQL:2008. However, OFFSET and FETCH clauses can appear in any order in PostgreSQL.

SELECT name
FROM people
ORDER BY id
OFFSET 2 ROWS FETCH FIRST 2 ROWS ONLY;

-- IN
-- can create a subquery within the parentheses

SELECT * FROM people WHERE name IN ('charlotte', 'Bob');
SELECT * FROM people WHERE name NOT IN ('charlotte', 'Bob');

SELECT *
FROM people
WHERE name IN
    (SELECT name
     FROM people); -- would probably compare this with a different table

-- BETWEEN
-- can also use with dates in YYYY-MM-DD format
SELECT * FROM people WHERE age BETWEEN 20 AND 50; -- inclusive
SELECT * FROM people WHERE age NOT BETWEEN 20 AND 50;

-- LIKE / ~~ / !~~
-- if no wildcard char is given LIKE acts as an = sign
-- % matches any sequence of chars
--  _ matches any SINGLE char
-- able to combine both symbols

-- ILIKE / ~~* / !~~ operator matches value case-insensitively

-- IS (NOT) NULL
-- can't use null = null => FALSE
-- so instead use IS NULL / IS NOT NULL

