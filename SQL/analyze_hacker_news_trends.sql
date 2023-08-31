-- 1
SELECT title,
    score
FROM hacker_news
ORDER BY score DESC
LIMIT 5;
SELECT SUM(score) AS 'Total Score'
FROM hacker_news;
-- 2
SELECT user,
    SUM(score) AS 'Total Score per User'
FROM hacker_news
GROUP BY 1
HAVING SUM(score) > 200;
SELECT ROUND(((309 + 304 + 282 + 517) / 6366.0) * 100, 0) AS 'Total Average of these Users';
-- 3
SELECT user,
    COUNT(*) AS 'Users who rickroll links'
FROM hacker_news
WHERE url LIKE '%watch?v=dQw4w9WgXcQ%'
GROUP BY 1
ORDER BY 2 DESC;
-- 4
SELECT CASE
        WHEN url LIKE '%github.com%' THEN 'Github'
        WHEN url LIKE '%medium.com%' THEN 'Medium'
        WHEN url LIKE '%nytimes.com%' THEN 'New York Times'
        ELSE 'Other'
    END AS 'Source',
    COUNT(*) AS 'Total per Souce'
FROM hacker_news
GROUP BY 1;
-- 5
SELECT timestamp,
    strftime('%H', timestamp) AS 'GET HOURS'
FROM hacker_news
GROUP BY 1
LIMIT 20;
-- 6
SELECT strftime('%H', timestamp) AS 'HOURS',
    ROUND(AVG(score), 1) AS 'AVERAGE SCORE',
    COUNT(*) AS 'TOTAL COUNT STORIES'
FROM hacker_news
WHERE timestamp IS NOT NULL
GROUP BY 1
ORDER BY 2 DESC;