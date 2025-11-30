# -Geolocation-Data-Aggregation-SQL-Focus-

A small project with MySQL

Project 4: Geolocation Data Aggregation (MySQL Focus)

This project, completed as part of the Udacity Data Analysis Nanodegree, focuses on leveraging SQL (MySQL) for data aggregation and analysis, demonstrating proficiency in handling timestamped event data.

🎯 Project Objective

The primary goal is to use relational database concepts to answer critical business questions about user engagement and location activity. Specifically, the project demonstrates how to:

Set up a database and table structure to host event data.

Perform basic aggregation (GROUP BY, COUNT) to measure traffic/volume.

Perform advanced time-series aggregation (MAX, Window Functions) to determine user recency and context.

📁 Files

checkins_analysis.sql: The complete MySQL script containing the database setup, simulated data insertion, and all analytical queries.

💾 Data Summary (Simulated)

The dataset simulates user check-in events, including:

Field

Data Type

Description

checkin_id

INT

Primary key for the event.

user_id

VARCHAR

Unique identifier for each user.

city

VARCHAR

The city where the check-in occurred.

timestamp

DATETIME

The exact time and date of the check-in.

⚙️ Key Analysis Queries

The following queries were developed to extract insights from the raw check-in data:

1. City Popularity (Traffic Volume)

Question: Which cities have the highest number of recorded user check-ins?

Method: Uses COUNT() and GROUP BY to summarize the data.

SELECT
    city,
    COUNT(checkin_id) AS total_checkins
FROM
    checkins
GROUP BY
    city
ORDER BY
    total_checkins DESC;


2. User Recency (Last Activity Time)

Question: When was the most recent check-in time for each unique user? (Answering the "recency" metric for R.F.M. analysis.)

Method: Uses the MAX() function on the timestamp field, grouped by user_id.

SELECT
    user_id,
    MAX(timestamp) AS last_checkin_time
FROM
    checkins
GROUP BY
    user_id
ORDER BY
    last_checkin_time DESC;


3. Contextual Recency (Last City and Time)

Question: What was the specific city and time of the last activity for each user?

Method: This requires matching the MAX(timestamp) back to the corresponding city row. The solution demonstrates two powerful SQL techniques:

Modern SQL: Using a Common Table Expression (CTE) with the ROW_NUMBER() Window Function.

Legacy SQL: Using a JOIN on a subquery that finds the maximum timestamp.
