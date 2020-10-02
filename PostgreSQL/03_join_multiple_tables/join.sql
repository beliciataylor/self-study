/* Joins i.e inner join, left join, right join, full outer join, cross join, natural join,
and self join */

/* Set up two tables basket_a and basket_b */
CREATE TABLE basket_a(
	a INT PRIMARY KEY,
	fruit_a VARCHAR (100) NOT NULL
);

CREATE TABLE basket_b(
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
	
-- use INNER JOIN to join basket_a with basket_b 
-- by matching values in fruit_a & fruit_b columns
SELECT
	a,
	fruit_a,
	b,
	fruit_b
FROM
	basket_a
INNER JOIN basket_b
	ON fruit_a = fruit_b;

-- use LEFT JOIN to join basket_a table w/ basket_b table
SELECT
	a,
	fruit_a,
	b,
	fruit_b
FROM
	basket_a
LEFT JOIN basket_b
	ON fruit_a = fruit_b;

-- select rows from left table that do not have matching rows in right table
-- i.e LEFT OUTER JOIN
SELECT
	a,
	fruit_a,
	b,
	fruit_b
FROM
	basket_a
LEFT JOIN basket_b
	ON fruit_a = fruit_b
WHERE b IS NULL;

-- use RIGHT JOIN to join basket_a w/ basket_b
SELECT
	a,
	fruit_a,
	b,
	fruit_b
FROM
	basket_a
RIGHT JOIN basket_b 
	ON fruit_a = fruit_b;

-- get rows from right table that do not match rows from left table
SELECT
	a,
	fruit_a,
	b,
	fruit_b
FROM
	basket_a
RIGHT JOIN basket_b 
	ON fruit_a = fruit_b
WHERE a IS NULL;

-- FULL OUTER JOIN: returns result set that contains all rows from both left and right
-- tables w/ matching rows from both sides if available
SELECT
	a,
	fruit_a,
	b,
	fruit_b
FROM
	basket_a
FULL OUTER JOIN basket_b
	ON fruit_a = fruit_b;
	
-- return rows that do not have matching rows in the other
SELECT
	a,
	fruit_a,
	b,
	fruit_b
FROM
	basket_a
FULL JOIN basket_b
	ON fruit_a = fruit_b
WHERE a IS NULL OR b IS NULL;






