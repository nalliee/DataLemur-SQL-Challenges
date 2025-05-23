-- Yelp Top Rated Businesses --

SELECT 
  COUNT(business_id) AS business_count,
  ROUND(100.0 * COUNT(business_id) / 
    (SELECT COUNT(business_id) FROM reviews),0) AS top_rated_pct
FROM reviews
WHERE review_stars IN (4,5);
