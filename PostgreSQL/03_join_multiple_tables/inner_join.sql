/*
INNER JOIN
- to select data from two tables, use INNER JOIN in SELECT statement
*/

SELECT
-- specify columns from both tables you want in SELECT clause
	pka,
	c1,
	pkb,
	c2
FROM
-- specify the main table
	A
-- specify the second table and provide the join condition after ON
INNER JOIN B ON pka = fka;

/*
How INNER JOIN works
-- INNER JOIN compares the value of the pka column with the value in the fka column of
   every row in the table B
-- If values are equal, inner join creates a new row that contains all columns of both tables
   an adds it to the result set
-- In case these values are not equal, inner join ignores them and moves to next row

If you're referencing columns with the same name from different tables, you'll get an error.
You need to qualify these columns using syntax "table_name.column_name".

In practice, you'll use table aliases to assign joined tables short names to make the query
more readable

*/

-- EXAMPLES
-- 1. Join two tables
SELECT 
	customer.customer_id,
	first_name,
	last_name,
	amount,
	payment_date
FROM
	customer
INNER JOIN payment
	ON payment.customer_id = customer.customer_id
ORDER BY payment_date;

-- produce same query but using aliases
SELECT
	c.customer_id,
	first_name,
	last_name,
	email,
	amount,
	payment_date
FROM
	customer c
INNER JOIN payment p
	ON p.customer_id = c.customer_id
--WHERE c.customer_id = 2;
ORDER BY payment_date;

-- Since both tables have save customer_id column, you can use the USING syntax
SELECT
	customer_id,
	first_name,
	last_name,
	amount,
	payment_date
FROM
	customer
INNER JOIN payment USING(customer_id)
ORDER BY payment_date;

-- Join three tables
SELECT
	c.customer_id,
	c.first_name customer_first_name,
	c.last_name customer_last_name,
	s.first_name staff_first_name,
	s.last_name staff_last_name,
	amount,
	payment_date
FROM
	customer c
INNER JOIN payment p
	ON p.customer_id = c.customer_id
INNER JOIN staff s
	ON p.staff_id = s.staff_id
ORDER BY payment_date;




