-- Airbnb - Matching Rental Amenities --

WITH airbnb_amenities AS (
  SELECT
    rental_id,
    ARRAY_AGG(amenity ORDER BY amenity) AS amenities
  FROM rental_amenities
  GROUP BY rental_id
)

SELECT COUNT(*) AS matching_airbnb
FROM airbnb_amenities AS a1
INNER JOIN airbnb_amenities AS a2
  ON a1.amenities = a2.amenities
WHERE a1.rental_id > a2.rental_id;
