/* print out version of postgresql */
SELECT version();

/* SELECT statement: find first names of all customers from customers table */
SELECT first_name FROM customer;

/* Retrieve first name, last name, and email of customers */
SELECT first_name, last_name, email FROM customer;

/* Select data from all columns of the customer table */
SELECT * FROM customer;

/* Select full names and emails of all customers */
SELECT first_name || ' ' || last_name, email FROM customer;

/* Use select statement with an expression */
SELECT 5 * 3;