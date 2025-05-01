-- Google Maps Flagged UGC --

WITH review AS (
  SELECT
    p.place_category,
    COUNT(content_id) AS content_count
  FROM place_info AS p
  INNER JOIN maps_ugc_review AS ugc
    ON p.place_id = ugc.place_id
  WHERE content_tag = 'Off-topic'
  GROUP BY p.place_category
)
, top_place_category AS (
  SELECT 
    place_category,
    RANK() OVER (ORDER BY content_count DESC) AS top_place
  FROM review
)

SELECT 
  place_category AS off_topic_places
FROM top_place_category
WHERE top_place = 1;
