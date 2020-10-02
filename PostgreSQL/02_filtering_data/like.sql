/* LIKE (& ILIKE): query data using pattern matches */

-- Match first name of the customer w/ a string
SELECT first_name, last_name
FROM customer
WHERE first_name LIKE 'Jen%';

/* PostgreSQL provides two wildcards:
	% (percent sign) - matches any squence of zero or more characters
	_ (underscore) - matches any single character
	If the pattern doesn't have wildcards, the LIKE operator behaves like the equal operator */

/* Syntax: value LIKE pattern
	The negation: value NOT LIKE pattern */
	
/* Select customers whose first name contains 'er' string */
SELECT first_name, last_name
FROM customer
WHERE first_name LIKE '%er%'
ORDER BY first_name;

/* Can combine the two wildcards */
SELECT first_name, last_name
FROM customer
WHERE first_name LIKE '_her%'
ORDER BY first_name;

/* Find customers whose first names do not begin with 'Jen' */
SELECT first_name, last_name
FROM customer
WHERE first_name NOT LIKE 'Jen%'
ORDER BY first_name

/* ILIKE works like LIKE operator; ILIKE operator matches values case-insensitively */
SELECT first_name, last_name
FROM customer
WHERE first_name ILIKE 'BAR%';

/* PostgreSQL provides some operators that act like LIKE, NOT LIKE, ILIKE and NOT ILIKE:
	~~ : LIKE
	~~* : ILIKE
	!~~ : NOT LIKE
	!~~* : NOT ILIKE
*/

