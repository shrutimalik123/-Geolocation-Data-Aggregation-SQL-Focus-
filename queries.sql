USE user_analytics;

-- QUERY 1: Find the count of check-ins per city (Aggregation)
-- Use GROUP BY and COUNT() to summarize the data.
SELECT
    city,
    COUNT(checkin_id) AS total_checkins
FROM
    checkins
GROUP BY
    city
ORDER BY
    total_checkins DESC;

-- QUERY 2: Find the last (most recent) check-in time for each user (Advanced Aggregation)
-- We use the MAX() function on the timestamp field, grouped by user_id.
SELECT
    user_id,
    MAX(timestamp) AS last_checkin_time
FROM
    checkins
GROUP BY
    user_id
ORDER BY
    last_checkin_time DESC;

-- QUERY 3 (Bonus): Find the city and time of the last check-in for each user.
-- This requires a JOIN or a Window Function (MySQL 8.0+ recommended)
-- Method 1: Using a Common Table Expression (CTE) and Window Function (ROW_NUMBER)
-- This is generally the most robust and readable method in modern SQL.
WITH RankedCheckins AS (
    SELECT
        user_id,
        city,
        timestamp,
        -- Assign a rank of 1 to the most recent check-in for each user
        ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY timestamp DESC) as rn
    FROM
        checkins
)
SELECT
    user_id,
    city,
    timestamp AS last_checkin_time
FROM
    RankedCheckins
WHERE
    rn = 1
ORDER BY
    last_checkin_time DESC;

-- Method 2: Using a Subquery with MAX() (More compatible with older MySQL versions)
SELECT
    c.user_id,
    c.city,
    c.timestamp
FROM
    checkins c
INNER JOIN
    -- Find the max (latest) timestamp for each user
    (SELECT user_id, MAX(timestamp) AS max_timestamp
     FROM checkins
     GROUP BY user_id) AS latest
ON
    c.user_id = latest.user_id AND c.timestamp = latest.max_timestamp
ORDER BY
    c.timestamp DESC;
