-- Uber User's Third Transaction --

WITH trans_num AS (
  SELECT 
    user_id,
    spend,
    transaction_date,
    ROW_NUMBER() OVER (
      PARTITION BY user_id ORDER BY transaction_date) AS row_num
  FROM transactions
)

SELECT
  user_id,
  spend,
  transaction_date
FROM trans_num
WHERE row_num = 3;
