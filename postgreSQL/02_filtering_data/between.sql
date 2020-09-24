/* BETWEEN: match a value against a range of values */

/* Syntax: value BETWEEN low AND high; 
	Similar to writing: value >= low and value <= high */

/* To check if a value is out of range, combine BETWEEN with NOT operator:
	value NOT BETWEEN low AND high;
	Similar to writing: value < low OR value > high; */

/* Select payments whose amount is between 8 and 9 USD */
SELECT customer_id, payment_id, amount
FROM payment
WHERE amount BETWEEN 8 AND 9;

/* Select payments whose amount is not in the range 8 and 9 */
SELECT customer_id, payment_id, amount
FROM payment
WHERE amount NOT BETWEEN 8 AND 9;

/* To check a value against a date change, use literal date in format YYYY-MM-DD:
	Select payments whose payment dates are between 2007-02-07 and 2007-02-15 */
SELECT customer_id, payment_id, amount, payment_date
FROM payment
WHERE payment_date BETWEEN '2007-02-07' AND '2007-02-15'

