-- https://www.khanacademy.org/computing/computer-programming/sql/sql-basics/pt/aggregating-data

-- note: to use ' in text of a query just use it twice (e.g. 'Jack O'' Lantern')

-- creating a table

CREATE TABLE groceries (id INTEGER PRIMARY KEY, food_name TEXT, quantity INTEGER, aisle INTEGER );

INSERT INTO groceries VALUES (1, 'pear', 10, 2);
-- can also write it this way:
INSERT INTO groceries(food_name, quantity, aisle) VALUES ('pear', 10, 2);

 
SELECT * FROM groceries;

-- make a selection to show only food with >5 as quantity and then list it in order of their quantitity 
SELECT * FROM groceries WHERE quantity > 5 ORDER BY quantity

-- returns all the aisles and the sum of quantity of all the items in each aisle 
SELECT aisle, SUM(quantity) FROM groceries GROUP BY aisle;


-- exmaple of a selection the long way and a short way
SELECT * FROM exercise_logs WHERE type = "biking" OR type = "hiking" OR type = "tree climbing" OR type = "rowing";
-- shorter method using IN
SELECT * FROM exercise_logs WHERE type IN ("biking", "hiking", "tree climbing", "rowing");
-- can also state NOT IN 
SELECT * FROM exercise_logs WHERE type NOT IN ("biking", "hiking", "tree climbing", "rowing");


-- to make an inexact match you use the lIKE operator e.g. in case a full stop is missing it will still match
SELECT * FROM exercise_logs WHERE type IN (
    SELECT type FROM drs_favorites WHERE reason LIKE "%cardiovascular%"); -- use the % on either side to match to just that word


-- CASE example from course:

CREATE TABLE student_grades (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    number_grade INTEGER,
    fraction_completed REAL);
    
INSERT INTO student_grades (name, number_grade, fraction_completed)
    VALUES ("Winston", 90, 0.805);
INSERT INTO student_grades (name, number_grade, fraction_completed)
    VALUES ("Winnefer", 95, 0.901);
INSERT INTO student_grades (name, number_grade, fraction_completed)
    VALUES ("Winsteen", 85, 0.906);
INSERT INTO student_grades (name, number_grade, fraction_completed)
    VALUES ("Wincifer", 66, 0.7054);
INSERT INTO student_grades (name, number_grade, fraction_completed)
    VALUES ("Winster", 76, 0.5013);
INSERT INTO student_grades (name, number_grade, fraction_completed)
    VALUES ("Winstonia", 82, 0.9045);
    

SELECT name, number_grade, ROUND(fraction_completed * 100) AS percent_completed FROM student_grades;

SELECT COUNT(*),
    CASE 
        WHEN ROUND(fraction_completed * 100) > 90 THEN "A"
        WHEN ROUND(fraction_completed * 100) > 80 THEN "B"
        WHEN ROUND(fraction_completed * 100) > 70 THEN "C"
        WHEN ROUND(fraction_completed * 100) > 60 THEN "D"
        WHEN ROUND(fraction_completed * 100) > 50 THEN "E"
        ELSE "F"
    END as "letter_grade"
FROM student_grades
GROUP BY letter_grade


-- CROSS JOIN --

-- it joins every possible row combination (I believe)
SELECT * FROM student_grades, students; -- just put two tables here (but it puts rows together irrelevant of matching id's so we don't use this)

-- IMPLICIT INNER JOIN --
-- makes sure they only match if the student id matches (however still not best way)

SELECT * FROM student_grades, students
  WHERE student_grades.student_id = students.id;


-- EXPLICIT INNER JOIN --

SELECT * FROM students
    JOIN student_grades
    ON students.id = student_grades.student_id;

-- for specific selection of columns (use table.column_name):
SELECT students.first_name, students.last_name, students.email, student_grades.test, student_grades.grade FROM students
    JOIN student_grades
    ON students.id = student_grades.student_id
    WHERE grade > 90;


-- OUTER JOIN -- 
-- allows you to create a table which includes ALL students not just if they have a project (and puts NULL in projects column)
SELECT students.first_name, students.last_name, student_projects.title
    FROM students
    LEFT OUTER JOIN student_projects
    ON students.id = student_projects.student_id;
    -- there is also a RIGHT OUTER join but can just use the LEFT one and switch the values over

-- my example:
SELECT  customers.name, customers.email, TOTAL(orders.price) AS total_amount_spent
    FROM customers
    LEFT OUTER JOIN orders
    ON customers.id = orders.customer_id
    GROUP BY customers.email ORDER BY orders.price DESC; -- orders by highest to lowest using DESC 



-- SELF JOINS (joining data in tables that relate to another id within the same table)

SELECT students.first_name, students.last_name, buddies.email as buddy_email
    FROM students
    JOIN students buddies 
    -- buddies is an alias given to one vs of students table so it can differentiate between the two references (since they are the same table)
    ON students.buddy_id = buddies.id;


-- combining different join types (explicit and self-joins)

SELECT a.title, b.title FROM project_pairs
    JOIN student_projects a
    ON project_pairs.project1_id = a.id
    JOIN student_projects b
    ON project_pairs.project2_id = b.id;
  

-- ALTER --
ALTER TABLE clothes ADD price INTEGER;
-- DELETE --
DELETE FROM clothes WHERE id=2
-- UPDATE --
UPDATE clothes SET name='Top' WHERE name='Jumper'

-- LIMIT --
-- use limit operator to limit updates to a certain number so you don't accidently update'del too many
UPDATE clothes SET name='Top' WHERE name='Jumper' LIMIT 1
DELETE users WHERE id = 1 LIMIT 1



  -- notes: some queries take longer than others and you must think of the most efficient 
  -- way to structure your query so less resources are used to conduct the query


