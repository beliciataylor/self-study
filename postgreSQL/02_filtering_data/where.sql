-- WHERE: filter rows returned by a SELECT statement
/* Syntax:
	SELECT select_list
	FROM table_name
	WHERE condition
	ORDER BY sort_expression */

/* The condition must evaluate to true, false, or unknown. It can be a boolean expression
	or a combination of boolean expressions using the AND and OR operators. Only rows where 
	the condition evaluates the true will be in the result set. */
	
/* Evaluation Chain: FROM -> WHERE -> SELECT -> ORDER BY
	If you use column aliases in SELECT, you cannot use them in the WHERE clause. */

/* You can use WHERE clause in UPDATE and DELETE statements. To form condition in WHERE
	clause, use comparison and logical operators: =, >, <, !=, AND, OR, IN, BETWEEN, LIKE,
	IS NULL, NOT, etc */

-- Use WHERE clause to find customers whose first name is Jamie
SELECT
	last_name,
	first_name
FROM
	customer
WHERE
	first_name = 'Jamie';
	
-- Use WHERE clause to find customers whose first name is Jamie and last name is Rice.
SELECT
	first_name,
	last_name
FROM
	customer
WHERE
	first_name = 'Jamie' AND
	last_name = 'Rice';

-- Find customers whose last name is Rodriguez or first name is Adam using OR operator
SELECT
	first_name,
	last_name
FROM
	customer
WHERE
	last_name = 'Rodriguez' OR
	first_name = 'Adam';

/* Match a string with any string in a list;
	EX. Find customers whose first name is Ann, Anne, or Annie */
SELECT
	first_name,
	last_name
FROM
	customer
WHERE
	first_name IN ('Ann', 'Anne', 'Annie');

/* Find a string that matches a pattern;
	EX. find all customers whose first name starts with the string Ann */
SELECT
	first_name,
	last_name
FROM
	customer
WHERE
	first_name LIKE 'Ann%'

/* Find customers whose first name starts with A and contains 3-5 characters */
SELECT
	first_name,
	LENGTH(first_name) name_length
FROM
	customer
WHERE
	first_name LIKE 'A%' AND
	LENGTH(first_name) BETWEEN 3 AND 5
ORDER BY
	name_length;

/* Find customers whose first names start with Bra and last names are not Motley */
SELECT
	first_name,
	last_name
FROM
	customer
WHERE 
	first_name LIKE 'Bra%' AND
	last_name <> 'Motley';

-- Note: Can use != in place of <>



