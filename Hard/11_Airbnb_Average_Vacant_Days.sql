-- Airbnb Average Vacant Days --

WITH listing_vacancies AS (
SELECT
  l.listing_id,
  365 - COALESCE(SUM (
  CASE WHEN b.checkout_date > '12/31/2021' THEN '12/31/2021' ELSE b.checkout_date END -
  CASE WHEN b.checkin_date < '01/01/2021' THEN '01/01/2021' ELSE b.checkin_date END
  ),0) AS vacant_days
FROM listings AS l
LEFT JOIN bookings AS b
  ON l.listing_id = b.listing_id
WHERE l.is_active = 1
GROUP BY l.listing_id
)

SELECT
  ROUND(AVG(vacant_days)) AS avg_vacant_days
FROM listing_vacancies;
