-- Visa - Monthly Merchant Balance --

WITH cte AS (
  SELECT 
    DATE_TRUNC('day', transaction_date) AS transaction_day,
    DATE_TRUNC('month', transaction_date) AS transaction_month,
    SUM(CASE WHEN type = 'deposit' THEN amount ELSE -amount END) AS balance
  FROM transactions
  GROUP BY transaction_day, transaction_month
)

SELECT 
  transaction_day,
  SUM(balance) OVER(PARTITION BY transaction_month ORDER BY transaction_day) AS balance
FROM cte
ORDER BY transaction_day;
