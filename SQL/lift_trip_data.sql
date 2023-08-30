SELECT MAX(trips_completed) AS 'Highest Trips Completed'
FROM cars;
-- 1
SELECT COUNT(*) AS 'Total Status Active'
FROM cars
WHERE status = 'active';
-- 2
SELECT *
FROM riders
WHERE total_trips < 500;
-- 3
SELECT ROUND(AVG(cost), 2) AS 'AVERAGE COST'
FROM trips;
-- 4
SELECT *
FROM riders
UNION
SELECT *
FROM riders2;
-- 5
SELECT *
FROM trips
    INNER JOIN cars ON trips.car_id = cars.id;
-- 6
SELECT *
FROM trips
    LEFT JOIN riders ON trips.rider_id = riders.id;
-- 7
SELECT *
FROM trips
    CROSS JOIN cars;
-- 8
SELECT *
FROM trips;
SELECT *
FROM riders;
SELECT *
FROM cars;