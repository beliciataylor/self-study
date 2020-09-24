/* IN (in the WHERE clause): check if a value matches any value in a list */

/* Syntax: value IN (value1, value2, ...) 
	Returns true if value matches any value in the list */
	
/* List of values can be a list of literal values or a result of a SELECT statement:
	value IN (SELECT column_name FROM table_name); 
	The query inside the parenthesis is called a subquery */

/* Want to know the rental information of customer id 1 and 2 */
SELECT customer_id, rental_id, return_date
FROM rental
WHERE customer_id IN (1,2) -- similar to writing: WHERE customer_id = 1 OR customer_id = 2
ORDER BY return_date DESC;

/* Combine IN operator with NOT operator to select rows whose values do not match the
	values in the list */
SELECT customer_id, rental_id, return_date
FROM rental
WHERE customer_id NOT IN (1,2); 
-- similar to writing: WHERE customer_id <> 1 AND customer_id <> 2;

/* Return a list of customer ids from the rental table w/ return date 2005-05-27 */
SELECT customer_id
FROM rental
WHERE CAST (return_date AS DATE) = '2005-05-27'
ORDER BY customer_id;

/* Above query returns a list of values so you can use it as the input of an IN operator */
SELECT customer_id, first_name, last_name
FROM customer
WHERE
	customer_id IN (
		SELECT customer_id
		FROM rental
		WHERE CAST (return_date as DATE) = '2005-05-27'
	)
ORDER BY customer_id;