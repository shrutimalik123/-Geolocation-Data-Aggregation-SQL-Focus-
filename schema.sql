-- Drop the database if it exists, to ensure a clean run
DROP DATABASE IF EXISTS user_analytics;

-- Create the database
CREATE DATABASE user_analytics;
USE user_analytics;

-- Create the checkins table
CREATE TABLE checkins (
    checkin_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id VARCHAR(50) NOT NULL,
    city VARCHAR(100) NOT NULL,
    timestamp DATETIME NOT NULL
);
