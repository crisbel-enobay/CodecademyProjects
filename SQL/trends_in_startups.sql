SELECT COUNT(*) AS 'Total Company'
FROM startups;
SELECT name,
    SUM(valuation) AS 'Total Value of All Companies'
FROM startups;
SELECT name,
    MAX(raised) AS 'Highest Amount Raised'
FROM startups;
SELECT name,
    MAX(raised) AS 'Highest Amount Raised',
    stage
FROM startups
WHERE stage = 'Seed';
SELECT name,
    founded,
    MIN(founded) AS 'The Oldest Company'
FROM startups;
SELECT name,
    AVG(valuation) AS 'Average by Valuation'
FROM startups;
SELECT category,
    AVG(valuation) AS 'Average by Category'
FROM startups
GROUP BY category;
-- 1
SELECT category,
    ROUND(AVG(valuation), 2) AS 'Ave by Category'
FROM startups
GROUP BY category;
-- 2
SELECT category,
    ROUND(AVG(valuation), 2) AS 'Ave by Category'
FROM startups
GROUP BY 1
ORDER BY 2 DESC;
-- 3
SELECT category,
    COUNT(*) AS 'Total Company by Category'
FROM startups
GROUP BY category;
-- 4
SELECT category,
    COUNT(*) AS 'Category with more than 3 companies'
FROM startups
GROUP BY category
HAVING COUNT(*) > 3;
-- 5
SELECT location,
    AVG(employees) AS 'Average Size(Employees) by Location'
FROM startups
GROUP BY 1;
-- 6
SELECT location,
    AVG(employees) AS 'Average Size With employees > 500 by Location'
FROM startups
GROUP BY 1
HAVING AVG(employees) > 500;
-- 7
SELECT *
FROM startups;