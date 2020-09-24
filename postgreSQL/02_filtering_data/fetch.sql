/* FETCH: retrieves a portion of rows returned by a query */

/* To conform with SQL standard, postgreSQL supports the FETCH clause to retrieve number
	of rows returned by a query */

/* Syntax: OFFSET start { ROW | ROWS}
		   FETCH { FIRST | NEXT } [ row_court ] { ROW | ROWS } ONLY
	FETCH is fuctionally equivalent to the LIMIT clause, but if you plan to have your application
	be compatible with other database systems, use FETCH clause because it follows standard SQL */

/* Select the first film sorted by titles in ascending order */
SELECT
	film_id,
	title
FROM
	film
ORDER BY
	title
FETCH FIRST ROW ONLY;
	
/* Select the first five films sorted by titles */
SELECT
	film_id,
	title
FROM
	film
ORDER BY
	title
FETCH FIRST 5 ROW ONLY;

/* Return next five films after the first five films sorted by titles */
SELECT
	film_id,
	title
FROM
	film
ORDER BY
	title
OFFSET 5 ROWS
FETCH FIRST 5 ROW ONLY;
	
	
	
	
	
	
	
	
	