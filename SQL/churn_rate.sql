-- 1. Take a look at the first 100 rows of data in the subscriptions table. How many different segments do you see?, there are 2(87,30)
SELECT *
FROM subscriptions
LIMIT 100;
-- 2. Determine the range of months of data provided. Which months will you be able to calculate churn for?
-- month of december 2016 to march 2017
SELECT MIN(subscription_start) AS 'FROM',
    MAX(subscription_start) AS 'UPTO'
FROM subscriptions;
-- 3. You’ll be calculating the churn rate for both segments (87 and 30) over the first 3 months of 2017 (you can’t calculate it for December, since there are no subscription_end values yet). To get started, create a temporary table of months.
WITH months AS (
    SELECT '2017-01-01' AS 'first_day',
        '2017-01-31' AS 'last_day'
    UNION
    SELECT '2017-02-01' AS 'first_day',
        '2017-02-28' AS 'last_day'
    UNION
    SELECT '2017-03-01' AS 'first_day',
        '2017-03-31' AS 'last_day'
),
-- 4. Create a temporary table, cross_join, from subscriptions and your months. Be sure to SELECT every column.
cross_join AS (
    SELECT *
    FROM subscriptions
        CROSS JOIN months
),
-- 5. Create a temporary table, status, from the cross_join table you created. This table should contain:
-- id selected from cross_join
-- month as an alias of first_day
-- is_active_87 created using a CASE WHEN to find any users from segment 87 who existed prior to the beginning of the month. This is 1 if true and 0 otherwise.
-- is_active_30 created using a CASE WHEN to find any users from segment 30 who existed prior to the beginning of the month. This is 1 if true and 0 otherwise.
status AS (
    SELECT id,
        first_day AS 'month',
        CASE
            WHEN (segment = 87)
            AND (subscription_start < first_day)
            AND (
                subscription_end > first_day
                OR subscription_end IS NULL
            ) THEN 1
            ELSE 0
        END AS 'is_active_87',
        CASE
            WHEN (segment = 30)
            AND (subscription_start < first_day)
            AND (
                subscription_end > first_day
                OR subscription_end IS NULL
            ) THEN 1
            ELSE 0
        END AS 'is_active_30',
        CASE
            WHEN (segment = 87)
            AND (
                subscription_end BETWEEN first_day AND last_day
            ) THEN 1
            ELSE 0
        END AS 'is_canceled_87',
        CASE
            WHEN (segment = 30)
            AND (
                subscription_end BETWEEN first_day AND last_day
            ) THEN 1
            ELSE 0
        END AS 'is_canceled_30'
    FROM cross_join
),
-- 7. Create a status_aggregate temporary table that is a SUM of the active and canceled subscriptions for each segment, for each month.
-- The resulting columns should be:
-- sum_active_87, sum_active_30, sum_canceled_87, sum_canceled_30
status_aggregate AS (
    SELECT month,
        SUM(is_active_87) AS 'sum_active_87',
        SUM(is_active_30) AS 'sum_active_30',
        SUM(is_canceled_87) AS 'sum_canceled_87',
        SUM(is_canceled_30) AS 'sum_canceled_30'
    FROM status
    GROUP BY month
) -- 8. Calculate the churn rates for the two segments over the three month period. Which segment has a lower churn rate?
SELECT month,
    ROUND((1.0 * sum_canceled_87 / sum_active_87) * 100, 2) AS 'churn_rate_87',
    ROUND((1.0 * sum_canceled_30 / sum_active_30) * 100, 2) AS 'churn_rate_30'
FROM status_aggregate;