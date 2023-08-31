-- 1. what are the columns inside the table state_climate
SELECT *
FROM state_climate
LIMIT 5;
-- 2. Write a query that returns the state, year, tempf or tempc, and running_avg_temp (in either Celsius or Fahrenheit) for each state.
-- (The running_avg_temp should use a window function.)
SELECT state,
    year,
    tempf,
    AVG(tempf) OVER (
        PARTITION BY state
        ORDER BY year
    ) AS 'running_avg_temp_f'
FROM state_climate
LIMIT 20;
-- 3. Write a query that returns state, year, tempf or tempc, and the lowest temperature (lowest_temp) for each state.
SELECT state,
    year,
    tempf,
    FIRST_VALUE(tempf) OVER (
        PARTITION BY state
        ORDER BY tempf
    ) AS 'lowest_temp'
FROM state_climate
LIMIT 10;
-- 4. Write a query that returns state, year, tempf or tempc, and the highest temperature (highest_temp) for each state.
SELECT state,
    year,
    tempf,
    LAST_VALUE(tempf) OVER (
        PARTITION BY state
        ORDER BY tempf RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS 'highest_temp'
FROM state_climate
LIMIT 10;
-- 5. Write a query to select the same columns but now you should write a window function that returns the change_in_temp from the previous year (no null values should be returned).
-- Which states and years saw the largest changes in temperature?
-- Is there a particular part of the United States that saw the largest yearly changes in temperature?
SELECT state,
    year,
    tempf,
    tempf - LAG(tempf, 1, tempf) OVER (
        PARTITION BY state
        ORDER BY year
    ) 'change_in_temp'
FROM state_climate
ORDER BY change_in_temp DESC
LIMIT 10;
-- 6. Write a query to return a rank of the coldest temperatures on record (coldest_rank) along with year, state, and tempf or tempc. Are the coldest ranked years recent or historic? The coldest years should be from any state or year.
SELECT state,
    year,
    tempf,
    RANK() OVER (
        ORDER BY tempf
    ) 'coldest_rank'
FROM state_climate
LIMIT 10;
-- 7. Modify your coldest_rank query to now instead return the warmest_rank for each state, meaning your query should return the warmest temp/year for each state. Again, are the warmest temperatures more recent or historic for each state?
SELECT state,
    year,
    tempf,
    RANK() OVER (
        ORDER BY tempf DESC
    ) 'warmest_rank'
FROM state_climate
LIMIT 10;
-- 8. Your query should return quartile, year, state and tempf or tempc. The top quartile should be the coldest years.
SELECT NTILE(4) OVER (
        PARTITION BY state
        ORDER BY tempf
    ) 'quartile',
    state,
    year,
    tempf
FROM state_climate
LIMIT 50;
-- 9. Your query should return quintile, year, state and tempf or tempc. The top quintile should be the coldest years overall, not by state.
SELECT NTILE(5) OVER (PARTITION BY tempf) 'quintile',
    state,
    year,
    tempf
FROM state_climate
ORDER BY tempf
LIMIT 50;