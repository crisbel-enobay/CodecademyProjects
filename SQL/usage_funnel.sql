-- 1. Select all columns from the first 10 rows. What columns does the table have?
SELECT *
FROM survey
LIMIT 10;
-- 2. What is the number of responses for each question?
SELECT question,
    COUNT(user_id)
FROM survey
GROUP BY 1;
-- 3. Which question(s) of the quiz have a lower completion rates?
-- question 5 has the lowest completion rates
SELECT question,
    ROUND((COUNT(user_id) * 100) / 500, 2) AS 'percentage'
FROM survey
GROUP BY 1;
-- 4. Examine the first five rows of each table
-- What are the column names?
SELECT *
FROM quiz
LIMIT 5;
SELECT *
FROM home_try_on
LIMIT 5;
SELECT *
FROM purchase
LIMIT 5;
-- 5. If the user has any entries in home_try_on, then is_home_try_on will be True.
-- number_of_pairs comes from home_try_on table
-- If the user has any entries in purchase, then is_purchase will be True.
SELECT DISTINCT q.user_id,
    CASE
        WHEN h.user_id IS NOT NULL THEN 'True'
        ELSE 'False'
    END AS 'is_home_try_on',
    h.number_of_pairs,
    CASE
        WHEN p.user_id IS NOT NULL THEN 'True'
        ELSE 'False'
    END AS 'is_purchase'
FROM quiz AS 'q'
    LEFT JOIN home_try_on AS 'h' ON h.user_id = q.user_id
    LEFT JOIN purchase AS 'p' ON p.user_id = h.user_id
LIMIT 10;
-- 6. We can calculate overall conversion rates by aggregating across all rows.
WITH q AS (
    SELECT COUNT(*) AS 'q_count'
    FROM quiz
),
h AS (
    SELECT COUNT(*) AS 'h_count'
    FROM home_try_on
),
p AS (
    SELECT COUNT(*) AS 'p_count'
    FROM purchase
)
SELECT q.q_count + h.h_count + p.p_count AS 'total_count'
FROM q,
    h,
    p;
-- We can compare conversion from quiz→home_try_on and home_try_on→purchase.
SELECT '1-quiz' AS 'stage',
    COUNT(DISTINCT user_id)
FROM quiz
UNION
SELECT '2-home_try_on' AS 'stage',
    COUNT(DISTINCT user_id)
FROM home_try_on
UNION
SELECT '3-purchase' AS 'stage',
    COUNT(DISTINCT user_id)
FROM purchase;
-- We can calculate the difference in purchase rates between customers who had 3 number_of_pairs with ones who had 5.
SELECT h.number_of_pairs AS 'AB_variant',
    COUNT(h.user_id) AS 'home_trial',
    COUNT(p.user_id) AS 'purchase'
FROM quiz AS 'q'
    LEFT JOIN home_try_on AS 'h' ON h.user_id = q.user_id
    LEFT JOIN purchase AS 'p' ON p.user_id = h.user_id
GROUP BY 1
HAVING h.number_of_pairs IS NOT NULL;
-- The most common results of the style quiz.
SELECT style,
    COUNT(*) AS 'most_common_results'
FROM quiz
GROUP BY 1
ORDER BY 2 DESC;
-- The most common types of purchase made
SELECT COUNT(product_id) AS 'total_purchase',
    style,
    model_name,
    color
FROM purchase
GROUP BY product_id
ORDER BY COUNT(product_id) DESC;