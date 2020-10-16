-- SECTION 3

-- setting up two sample tables:

CREATE TABLE basket_a (
    a INT PRIMARY KEY,
    fruit_a VARCHAR (100) NOT NULL
);

CREATE TABLE basket_b (
    b INT PRIMARY KEY,
    fruit_b VARCHAR (100) NOT NULL
);

INSERT INTO basket_a (a, fruit_a)
VALUES
    (1, 'Apple'),
    (2, 'Orange'),
    (3, 'Banana'),
    (4, 'Cucumber');

INSERT INTO basket_b (b, fruit_b)
VALUES
    (1, 'Orange'),
    (2, 'Apple'),
    (3, 'Watermelon'),
    (4, 'Pear');

SELECT * FROM basket_a, basket_b;


-- INNER JOIN
SELECT
    a,
    fruit_a,
    b,
    fruit_b
FROM
    basket_a
INNER JOIN basket_b
    ON fruit_a = fruit_b;


-- if both tables have the same column name you can use:
-- INNER JOIN payment USING(customer_id)
-- able to make INNER JOINs with mutiple tables

-- CROSS JOIN 
-- creates a table with all possible combinations of VALUES

SELECT fruit_a, fruit_b FROM basket_a CROSS JOIN basket_b;



-- NATURAL JOIN
-- will join tables based on column names
-- can cause unexpected results however (usually if unrelated column names match)

SELECT * FROM products
NATURAL JOIN categories;

-- is the same as:

SELECT	* FROM products
INNER JOIN categories USING (category_id);

-- both tables have category_id columns 



