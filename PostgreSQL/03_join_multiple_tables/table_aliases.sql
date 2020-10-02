/*
Table Aliases
- assigns temporarily assign tables new names during the execution of a query
- syntax: table_name AS alias_name; (AS is optional)
*/

/*
Practical applications of table aliases
1. use table aliases for long table names & make queries more readable
- EX. a_very_long_table_name.column_name; vs
  a_very_long_table_name AS alias, alias.column_name

2. use table aliases in join clauses
- need to qualify columns coming from multiple tables
*/

SELECT
	c.customer_id,
	first_name,
	amount,
	payment_date
FROM
	customer c
INNER JOIN payment p
	ON p.customer_id == c.customer_id
ORDER BY
	payment_date DESC;

/*
3. Use table aliases in self-join
- when joining a table with itself (self-join) need to use table aliases b/c referencing
  same table multiple times within a query results in an error
*/

SELECT
	e.first_name employee,
	m.first_name manager
FROM
	employee e
INNER JOIN employee m
	ON m.employee_id = e.manager_id
ORDER BY manager;
