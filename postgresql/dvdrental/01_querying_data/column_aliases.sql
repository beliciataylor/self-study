/* Column Aliases: SELECT column_name AS alias_name FROM table_name;
(Note: the AS is optional) */

/* 1. Assigning a column alias to a column example */
SELECT 
	first_name, 
	last_name AS surname 
FROM customer;

SELECT 
	first_name, 
	last_name surname 
FROM customer;

/* 2. Assigning a column alias to an expression example */
/* WITHOUT ALIAS */
SELECT
	first_name || ' ' || last_name
FROM
	customer;
/* Note: || is concatenating operator that concatenates one 
   or more strings into a single string */
/* WITH ALIAS */
SELECT
	first_name || ' ' || last_name AS full_name
FROM
	customer;

/* 3. Column aliases that contain spaces */
SELECT
	first_name || ' ' || last_name "full name"
FROM
	customer;


