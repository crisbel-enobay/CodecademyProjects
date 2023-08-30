-- 1. What are the column name inside this tables?
-- PLACES: id, name, address, type, average_rating, price_point, total_reviews
-- REVIEWS: id, username, place_id, review_date, rate, note
SELECT *
FROM places
LIMIT 10;
SELECT *
FROM reviews
LIMIT 10;
-- 2. If each dollar sign ($) represents $10, how could you find all places that cost $20 or less?
SELECT *
FROM places
WHERE price_point = '$'
    OR price_point = '$$';
-- 3. What columns can be used to JOIN these two tables?
SELECT *
FROM places
    JOIN reviews ON places.id = reviews.place_id
LIMIT 10;
-- 4. Write a query to do an INNER JOIN on the two tables to show all reviews for restaurants that have at least one review.
SELECT *
FROM places
    INNER JOIN reviews ON places.id = reviews.place_id
WHERE places.type = 'Restaurant';
-- Modify your previous query to select only the most important columns in order to display a log of reviews by selecting the following:
-- From the places table: name, average_rating
-- From the reviews table: username, rating, review_date, note
SELECT places.name,
    places.average_rating,
    reviews.username,
    reviews.rating,
    reviews.review_date,
    reviews.note
FROM places
    INNER JOIN reviews ON places.id = reviews.place_id;
-- 6. difference between using left join than inner join from the last code
-- left join take all the data from the left table while not minding whether there is an actual data on the right table resulting to null values on some of the column in right tables.
SELECT places.name,
    places.average_rating,
    reviews.username,
    reviews.rating,
    reviews.review_date,
    reviews.note
FROM places
    LEFT JOIN reviews ON places.id = reviews.place_id;
-- 7. Write a query to find all the ids of places that currently do not have any reviews in our reviews table.
SELECT places.id,
    places.name
FROM places
    LEFT JOIN reviews ON places.id = reviews.place_id
WHERE reviews.place_id IS NULL;
-- 8. Write a query using the WITH clause to select all the reviews that happened in 2020. JOIN the places to your WITH query to see a log of all reviews from 2020.
-- (This will use the WITH clause as well as the strftime() function. See if you can use Google to dig up some information about the function before take a look at the hint.)
WITH reviews_2020 AS (
    SELECT *
    FROM reviews
    WHERE strftime('%Y', review_date) = '2020'
)
SELECT *
FROM reviews
    INNER JOIN reviews_2020 ON reviews.place_id = reviews_2020.place_id
WHERE reviews.review_date = reviews_2020.review_date;
-- 9. Businesses want to be on the lookout for …ahem… difficult reviewers. Write a query that finds the reviewer with the most reviews that are BELOW the average rating for places.
SELECT reviews.username,
    reviews.place_id,
    places.name,
    COUNT(*) AS below_avg_reviews
FROM reviews
    JOIN places ON places.id = reviews.place_id
WHERE reviews.rating < places.average_rating
GROUP BY 1,
    2,
    3
ORDER BY 4 DESC
LIMIT 10;