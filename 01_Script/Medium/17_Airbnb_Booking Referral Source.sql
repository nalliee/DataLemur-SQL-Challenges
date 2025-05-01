-- Airbnb Booking Referral Source --

WITH user_bookings AS (
  SELECT
    b.booking_id,
    ROW_NUMBER() OVER (
      PARTITION BY b.user_id 
      ORDER BY b.booking_date) AS booking_num,
    a.channel
  FROM bookings AS b
  INNER JOIN booking_attribution AS a
    ON b.booking_id = a.booking_id
),
first_bookings AS (
  SELECT 
    channel,
    COUNT(*) AS channel_booking
  FROM user_bookings
  WHERE booking_num = 1
  GROUP BY channel
)

SELECT
  channel,
  ROUND(100.0 * (channel_booking /
    (SELECT SUM(channel_booking) FROM first_bookings)), 0) AS first_booking_pct
FROM first_bookings
WHERE channel IS NOT NULL
ORDER BY first_booking_pct DESC
LIMIT 1;
