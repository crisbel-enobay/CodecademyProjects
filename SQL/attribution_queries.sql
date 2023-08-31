-- 1. How many campaigns and sources does CoolTShirts use? Which source is used for each campaign?
-- Use three queries:
-- one for the number of distinct campaigns,
SELECT COUNT(DISTINCT utm_campaign)
FROM page_visits;
-- one for the number of distinct sources,
SELECT COUNT(DISTINCT utm_source)
FROM page_visits;
-- one to find how they are related.
SELECT DISTINCT utm_campaign,
    utm_source
FROM page_visits;
-- 2. What pages are on the CoolTShirts website?
-- Find the distinct values of the page_name column.
SELECT DISTINCT page_name
FROM page_visits;
-- 3. How many first touches is each campaign responsible for?
WITH first_touch AS (
    SELECT user_id,
        MIN(timestamp) as first_touch_at
    FROM page_visits
    GROUP BY user_id
)
SELECT ft.user_id,
    ft.first_touch_at,
    pv.utm_source,
    pv.utm_campaign,
    COUNT(utm_campaign)
FROM first_touch ft
    JOIN page_visits pv ON ft.user_id = pv.user_id
    AND ft.first_touch_at = pv.timestamp
GROUP BY utm_campaign;
-- 4. How many last touches is each campaign responsible for?
WITH last_touch AS (
    SELECT user_id,
        MAX(timestamp) as last_touch_at
    FROM page_visits
    GROUP BY user_id
)
SELECT lt.user_id,
    lt.last_touch_at,
    pv.utm_source,
    pv.utm_campaign,
    COUNT(utm_campaign)
FROM last_touch lt
    JOIN page_visits pv ON lt.user_id = pv.user_id
    AND lt.last_touch_at = pv.timestamp
GROUP BY utm_campaign;
-- How many visitors make a purchase?
-- Count the distinct users who visited the page named 4 - purchase.
SELECT COUNT(DISTINCT user_id),
    page_name
FROM page_visits
WHERE page_name = '4 - purchase';
-- 6. How many last touches on the purchase page is each campaign responsible for?
WITH last_touch AS (
    SELECT user_id,
        MAX(timestamp) as last_touch_at
    FROM page_visits
    WHERE page_name = '4 - purchase'
    GROUP BY user_id
)
SELECT lt.user_id,
    lt.last_touch_at,
    pv.utm_source,
    pv.utm_campaign,
    COUNT(utm_campaign)
FROM last_touch lt
    JOIN page_visits pv ON lt.user_id = pv.user_id
    AND lt.last_touch_at = pv.timestamp
GROUP BY utm_campaign
ORDER BY COUNT(utm_campaign) DESC;
-- 7. CoolTShirts can re-invest in 5 campaigns. Given your findings in the project, which should they pick and why?
-- based on the findings of the campaigns with last went to and page under purchase, these are the 5 with most visits: weekly-newsletter, retargetting-ad, retargetting-campaign, paid-search, ten-crazy-cool-tshirts-facts