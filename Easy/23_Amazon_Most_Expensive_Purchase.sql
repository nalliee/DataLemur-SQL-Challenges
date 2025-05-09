-- Amazon Most Expensive Purchase --

SELECT
  customer_id,
  MAX(purchase_amount) as purchase_amount
FROM transactions
GROUP BY customer_id
ORDER BY MAX(purchase_amount) DESC;
