-- Stitch Fix - Repeat Purchases on Multiple Days --

WITH repeat_purchaser AS (
  SELECT DISTINCT user_id AS users
  FROM purchases
  GROUP BY user_id, product_id
  HAVING COUNT(DISTINCT purchase_date::DATE) > 1
)

SELECT COUNT(users) AS repeat_purchasers
FROM repeat_purchaser;
