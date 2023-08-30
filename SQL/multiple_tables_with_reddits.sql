-- 1. Write queries to select the rows from each table. Because some of the tables have many rows, select just the first 10 rows from each.
-- What are the column names of each table?
SELECT *
FROM users
LIMIT 10;
-- id, username, email, join_date, score
SELECT *
FROM posts
LIMIT 10;
-- id, title, user_id, subreddit_id, score, created_date
SELECT *
FROM subreddits
LIMIT 10;
-- id, name, created_date, subscriber_count
-- 2. What is the primary key for each table? Can you identify any foreign keys?
-- users table primary key is id
-- posts table primary key is id, foreign key are user_id and subreddit_id
-- subreddits primary key is  id
-- 3. Write a query to count how many different subreddits there are.
SELECT COUNT(*) AS 'subreddit_count'
FROM subreddits;
-- 4. Write a few more queries to figure out the following information:
-- What user has the highest score?
-- What post has the highest score?
-- What are the top 5 subreddits with the highest subscriber_count?
SELECT username,
    MAX(score) AS 'highest_score'
FROM users;
SELECT title AS 'post_title',
    MAX(score) AS 'highest_score'
FROM posts;
SELECT name,
    subscriber_count AS 'top_5_subreddits'
FROM subreddits
ORDER BY subscriber_count DESC
LIMIT 5;
-- 5. Use a LEFT JOIN with the users and posts tables to find out how many posts each user has made. Have the users table as the left table and order the data by the number of posts in descending order.
SELECT u.username,
    COUNT(*) AS 'post_made'
FROM users u
    LEFT JOIN posts p ON u.id = p.user_id
GROUP BY 1
ORDER BY 2 DESC;
-- 6. We only want to see existing posts where the users are still active, so use an INNER JOIN to write a query to get these posts. Have the posts table as the left table.
SELECT *
FROM posts p
    INNER JOIN users u ON p.user_id = u.id;
-- 7. Stack the new posts2 table under the existing posts table to see them.
SELECT *
FROM posts
UNION
SELECT *
FROM posts2;
-- 8. FIRST, create the temporary table that we’ll nest in the WITH clause by writing a query to select all the posts that have a score of at least 5000.
-- Next, place the previous query within a WITH clause, and alias this table as popular_posts.
-- Finally, utilize an INNER JOIN to join this table with the subreddits table, with subreddits as the left table. Select the subreddit name, the title and score of each post, and order the results by each popular post’s score in descending order.
WITH popular_posts AS (
    SELECT *
    FROM posts
    WHERE score >= 5000
)
SELECT subreddits.name,
    popular_posts.title,
    popular_posts.score
FROM subreddits
    INNER JOIN popular_posts ON subreddits.id = popular_posts.subreddit_id
ORDER by popular_posts.score DESC;
-- 9. Next, you need to find out the highest scoring post for each subreddit.
-- Do this by using an INNER JOIN, with posts as the left table
SELECT s.name AS 'subreddit_name',
    p.title,
    MAX(p.score) AS 'highest score'
FROM posts p
    INNER JOIN subreddits s ON p.subreddit_id = s.id
GROUP BY s.id;
-- 10. Finally, you need to write a query to calculate the average score of all the posts for each subreddit.
-- Consider utilizing a JOIN, AVG, and GROUP BY to accomplish this, with the subreddits table as the left table.
SELECT s.name AS 'subreddit_name',
    ROUND(AVG(p.score), 2) AS 'average_score'
FROM subreddits s
    JOIN posts p ON s.id = p.subreddit_id
GROUP BY 1
ORDER BY 2 DESC;