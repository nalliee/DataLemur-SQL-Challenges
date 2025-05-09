-- Etsy First Transaction --

WITH cte AS (
  SELECT 
    user_id,
    spend,
    transaction_date,
    RANK() OVER(
      PARTITION BY user_id
      ORDER BY transaction_date) AS ranking
  FROM user_transactions
)

SELECT COUNT(DISTINCT user_id) AS users
FROM cte
WHERE ranking = 1
  AND spend >= 50;
