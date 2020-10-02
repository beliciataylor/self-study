/* ORDER BY */
/* Syntax: 
	SELECT select_list 
	FROM table_name 
	ORDER BY sort_expression1 [ASC | DESC], ...
	sort_expressionN [ASC | DESC]; */

/* Sort customers by first name in ascending order 
   NOTE: Can omit ASC since ORDER BY assumes it by default */
SELECT
	first_name,
	last_name
FROM
	customer
ORDER BY
	first_name ASC;
	
/* Sort rows by values in the last name column in descending order */
SELECT
	first_name,
	last_name
FROM
	customer
ORDER BY
	last_name DESC;

/* Sort rows by first name in ascending order and last name in descending order */
SELECT
	first_name,
	last_name
FROM
	customer
ORDER BY
	first_name ASC,
	last_name DESC;

/* Sort rows by the lengths of the first names 
   Note: ORDER BY clause is evaluated after SELECT clause, so you can use
   the column alias in ORDER BY clause. */
SELECT
	first_name,
	LENGTH(first_name) len
FROM
	customer
ORDER BY
	len DESC;

/* When you sort rows that contain NULL, you can specify the order of NULL with other 
   non-null values by specifying NULLS FIRST or NULLS LAST option in ORDER BY clause.
   Syntax: ORDER BY sort_expression [ASC | DESC] [NULLS FIRST | NULLS LAST] */

/* Create table for the demonstration */
-- Create a new table
CREATE TABLE sort_demo(
	num INT
);

-- Insert some data
INSERT INTO sort_demo(num)
VALUES(1),(2),(3),(null);

--Return data from sort_demo table
SELECT num
FROM sort_demo
ORDER BY num;

/* ORDER BY clause sorted values in num column by ascending order and places the NULL at 
   the end. If you use ASC option, ORDER BY uses NULL LAST by default. The following query
   gives the same result. */
SELECT num
FROM sort_demo
ORDER BY num NULLS LAST;

-- Place NULL before other non-null values by using NULLS FIRST option
SELECT num
FROM sort_demo
ORDER BY num NULLS FIRST;

-- Sort values in num column of sort_demo in descending order
SELECT num
FROM sort_demo
ORDER BY num DESC;

/* ORDER BY clause with DESC option uses NULL FIRST as default. To reverse the order, use
   NULLS LAST option. */
SELECT num
FROM sort_demo
ORDER BY num DESC NULLS LAST;