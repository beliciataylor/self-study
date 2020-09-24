-- SELECT DISTINCT
/* The DISTINCT clause is used in SELECT statements to remove duplicate rows from a result.
   DISTINCT keeps one row for each group of duplicates and can be applied to one or more 
   columns in the select list.
   Syntax: SELECT DISTINCT column1 FROM table_name; */
   
/* If you select multiple columns, DISTINCT will evaluate the duplicate based on the 
   combination of values of these columns.
   SYNTAX: SELECT DISTINCT column1, column2 FROM table_name; */
   
/* DISTINCT ON (expression) keeps the "first" row of each group of duplicates 
   Syntax:
   SELECT
   		DISTINCT ON (column1) column_alias,
		column 2
	FROM
		table_name
	ORDER BY
		column1,
		column2;
	Notice: DISTINCT ON expression must match leftmost expression in the ORDER BY clause */

/* Create a new table called distinct_demo with three columns: id, bcolor, and fcolor */
CREATE TABLE distinct_demo (
	id serial NOT NULL PRIMARY KEY,
	bcolor VARCHAR,
	fcolor VARCHAR
)

/* Insert rows into distinct_demo */
INSERT INTO distinct_demo (bcolor, fcolor)
VALUES
	('red', 'red'),
	('red', 'red'),
	('red', NULL),
	(NULL, 'red'),
	('red', 'green'),
	('red', 'blue'),
	('green', 'red'),
	('green', 'blue'),
	('green', 'green'),
	('blue', 'red'),
	('blue', 'green'),
	('blue', 'blue');
   
/* Query data from the distinct_demo table */
SELECT
	id,
	bcolor,
	fcolor
FROM
	distinct_demo;

/* Select unique values in bcolor column and sort results in alphabetical order */
SELECT
	DISTINCT bcolor
FROM
	distinct_demo
ORDER BY
	bcolor;

/* Use DISTINCT clause on multiple columns */
SELECT
	DISTINCT bcolor,
	fcolor
FROM
	distinct_demo
ORDER BY
	bcolor,
	fcolor;
-- Note: One row was removed because it was a duplicate

/* Sort results set by bcolor and fcolor, then for each group of duplicates, keep the first
   row in the returned result set */
SELECT
	DISTINCT ON (bcolor) bcolor,
	fcolor
FROM
	distinct_demo
ORDER BY
	bcolor,
	fcolor;
