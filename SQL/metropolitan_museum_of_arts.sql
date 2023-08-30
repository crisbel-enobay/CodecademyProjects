-- 1. What are the column names?
-- id, department, category, title, artist, date
-- medium, country
SELECT *
FROM met
LIMIT 10;
-- 2. Calculate pieces of the American Decorative Art collection
SELECT department,
    COUNT(*) AS 'Total'
FROM met;
-- 3. Count the number of pieces where the category includes ‘celery’.
SELECT category,
    COUNT(*) AS 'Total'
FROM met
WHERE category LIKE '%celery%';
-- 4. Find the title and medium of the oldest piece(s) in the collection.
SELECT title,
    medium,
    MIN(date) AS 'Oldest Piece'
FROM met;
-- 5. Find the top 10 countries with the most pieces in the collection.
SELECT country,
    COUNT(*)
FROM met
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;
-- 6. Find the categories HAVING more than 100 pieces.
SELECT category,
    COUNT(*) AS 'pieces'
FROM met
GROUP BY 1
HAVING pieces > 100;
-- 7. Count the number of pieces where the medium contains ‘gold’ or ‘silver’.
-- And sort in descending order.
SELECT medium,
    COUNT(*)
FROM met
WHERE medium LIKE '%gold%'
    OR medium LIKE '%silver%'
GROUP BY 1
ORDER BY 2 DESC;