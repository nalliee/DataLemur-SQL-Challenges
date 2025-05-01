-- Uber 2nd Ride Delay --

WITH moment_users AS (
  SELECT 
    u.user_id
  FROM users AS u
  INNER JOIN rides AS r
    ON u.user_id = r.user_id
    AND u.registration_date = r.ride_date
),
rides_cte AS (
  SELECT
    r.user_id,
    r.ride_date,
    ROW_NUMBER() OVER (
      PARTITION BY u.user_id 
      ORDER BY r.ride_date) AS ride_nr,
    LAG(r.ride_date) OVER (
      PARTITION BY u.user_id
      ORDER BY r.ride_date) AS lag_ride_date
  FROM moment_users AS u
  LEFT JOIN rides AS r
    ON u.user_id = r.user_id
)

SELECT ROUND(AVG(ride_date - lag_ride_date),2) AS average_delay
FROM rides_cte
WHERE ride_nr = 2;
