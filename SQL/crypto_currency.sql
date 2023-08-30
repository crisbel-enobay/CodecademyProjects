-- 1. What are the column names?
-- id, user_id, date, currency, money_in, money_out
SELECT *
FROM transactions
LIMIT 10;
-- 2. What is the total money_in in the table?
SELECT SUM(money_in) AS 'total_sum_money_in'
FROM transactions;
-- 3. What is the total money_out in the table?
SELECT SUM(money_out) AS 'total_sum_money_out'
FROM transactions;
-- 4.How many money_in transactions are in this table?
-- How many money_in transactions are in this table where ‘BIT’ is the currency?
SELECT COUNT(money_in) AS 'total_count_money_in_with_BIT'
FROM transactions
WHERE currency = 'BIT';
-- 5. What was the largest transaction in this whole table?
-- was it money_inn or money_out?
SELECT MAX(money_in) AS 'max_money_in',
    MAX(money_out) AS 'max_money_out',
    CASE
        WHEN MAX(money_in) > MAX(money_out) THEN 'money_in'
        ELSE 'money_out'
    END AS 'largest_transaction'
FROM transactions;
-- 6. What is the average money_in in the table for the currency Ethereum('ETH')?
SELECT AVG(money_in) AS 'average_money_in'
FROM transactions
WHERE currency = 'ETH';
-- 7. Let’s build a ledger for the different dates.
-- Select date, average money_in, and average money_out from the table.
-- And group everything by date.
-- 8. To make the previous query easier to read round the averages to 2 decimal places.
-- Give the column aliases using AS for readability
SELECT date AS 'Date',
    ROUND(AVG(money_in), 2) AS 'Average Buy',
    ROUND(AVG(money_out), 2) AS 'Average Sell'
FROM transactions
GROUP BY 1;