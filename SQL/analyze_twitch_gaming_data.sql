-- 1. Start by getting a feel for the stream table and the chat table.
SELECT *
FROM stream
LIMIT 20;
SELECT *
FROM chat
LIMIT 20;
-- 2. What are the unique games in the stream table?
SELECT DISTINCT game
FROM stream;
-- 3. What are the unique channels in the stream table?
SELECT DISTINCT channel
FROM stream;
-- 4. What are the most popular games in the stream table?
-- Create a list of games and their number of viewers using GROUP BY.
SELECT game,
    COUNT(*) as 'viewers'
FROM stream
GROUP BY game
ORDER BY 2 DESC;
-- 5. Create a list of countries and their number of LoL viewers using WHERE and GROUP BY.
SELECT country,
    COUNT(*) as 'LOL viewers'
FROM stream
WHERE game = 'League of Legends'
GROUP BY 1
ORDER BY 2 DESC;
-- 6. Create a list of players and their number of streamers.
SELECT player,
    COUNT(*) as 'number_of_streamers'
FROM stream
GROUP BY 1
ORDER BY 2 DESC;
-- 7. Create a new column named genre for each of the games.
SELECT game,
    CASE
        WHEN game IN (
            'League of Legends',
            'Dota 2',
            'Heroes of the Storm'
        ) THEN 'MOBA'
        WHEN game = 'Counter-Strike: Global Offensive' THEN 'FPS'
        WHEN game IN ('DayZ', 'ARK: Survival Evolved') THEN 'Survival'
        ELSE 'Other'
    END AS 'genre',
    COUNT(*)
FROM stream
GROUP BY 1
ORDER BY 3 DESC;
-- 8. let’s run this query and take a look at the time column from the stream table:
SELECT time
FROM stream
LIMIT 10;
-- 9. Let’s test this function out:
SELECT time,
    STRFTIME('%S', time)
FROM stream
GROUP BY 1
LIMIT 10;
-- 10. Let’s write a query that returns two columns:
-- The hours of the time column
-- The view count for each hour
-- Lastly, filter the result with only the users in your country using a WHERE clause.
SELECT country,
    STRFTIME('%H', time) AS 'hours',
    COUNT(*)
FROM stream
WHERE country = 'PH'
GROUP BY 2;
-- The stream table and the chat table share a column: device_id.
-- Let’s join the two tables on that column.
SELECT *
FROM stream
    JOIN chat ON stream.device_id = chat.device_id;