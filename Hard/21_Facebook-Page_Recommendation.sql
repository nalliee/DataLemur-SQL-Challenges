-- Facebook - Page Recommendation --

WITH two_way_friendship AS (
  SELECT user_id, friend_id
  FROM friendship 
  UNION
  SELECT friend_id, user_id
  FROM friendship
)
, recommended_pages AS (
  SELECT 
    f.user_id,
    p.page_id,
    COUNT(*) AS followers
  FROM two_way_friendship AS f
  LEFT JOIN page_following AS p
    ON f.friend_id = p.user_id
  WHERE NOT EXISTS(
    SELECT id
    FROM page_following AS p2
    WHERE f.user_id = p2.user_id
      AND p.page_id = p2.page_id)
  GROUP BY f.user_id, p.page_id
)
, top_pages AS (
  SELECT 
    user_id,
    page_id,
    followers,
    DENSE_RANK() OVER(
      PARTITION BY user_id ORDER BY followers DESC) AS rnk
  FROM recommended_pages
)

SELECT
  user_id,
  page_id AS Page_Recommended
FROM top_pages
WHERE rnk = 1
ORDER BY user_id;
