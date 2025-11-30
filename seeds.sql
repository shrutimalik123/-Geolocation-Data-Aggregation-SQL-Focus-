USE user_analytics;

INSERT INTO checkins (user_id, city, timestamp) VALUES
('User_A101', 'New York', '2025-10-01 08:30:00'),
('User_B202', 'Los Angeles', '2025-10-01 12:45:00'),
('User_C303', 'New York', '2025-10-01 18:00:00'),
('User_A101', 'Boston', '2025-10-02 09:15:00'), -- User A new city
('User_B202', 'Los Angeles', '2025-10-02 14:20:00'), -- User B checkin 2
('User_C303', 'New York', '2025-10-02 19:30:00'),
('User_D404', 'Chicago', '2025-10-03 10:00:00'),
('User_A101', 'Boston', '2025-10-03 11:40:00'), -- User A checkin 3 (Latest in Boston)
('User_D404', 'Chicago', '2025-10-04 15:15:00'),
('User_B202', 'San Francisco', '2025-10-04 17:00:00'), -- User B new city (Latest overall)
('User_E505', 'New York', '2025-10-05 21:05:00'), -- New User E
('User_C303', 'Houston', '2025-10-06 13:30:00'); -- User C new city
