-- Apple Follow-Up Airpod Percentage --

WITH lag_products AS (
  SELECT 
    customer_id,
    product_name,
    LAG(product_name) OVER(
      PARTITION BY customer_id
      ORDER BY transaction_timestamp) AS prev_prod
  FROM transactions
  GROUP BY
    customer_id,
    product_name,
    transaction_timestamp
),
interested_users AS (
  SELECT customer_id AS airpod_iphone_buyers
  FROM lag_products
  WHERE LOWER(product_name) = 'airpods'
    AND LOWER(prev_prod) = 'iphone'
  GROUP BY customer_id
)

SELECT
  ROUND(100.0 * 
    COUNT(DISTINCT iu.airpod_iphone_buyers)::DECIMAL
    / COUNT(DISTINCT t.customer_id)::DECIMAL, 0) 
FROM transactions AS t
LEFT JOIN interested_users AS iu
  ON iu.airpod_iphone_buyers = t.customer_id;
