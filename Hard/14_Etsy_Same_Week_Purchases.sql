-- Etsy Same Week Purchases --

SELECT 
  ROUND(100.0 *
    COUNT(DISTINCT p.user_id) / COUNT(DISTINCT s.user_id), 2) AS single_purchase_pct 
FROM signups AS s
LEFT JOIN user_purchases AS p
  ON s.user_id = p.user_id
WHERE p.purchase_date IS NULL
  OR (p.purchase_date BETWEEN s.signup_date
  AND (s.signup_date + INTERVAL '7 days'));
