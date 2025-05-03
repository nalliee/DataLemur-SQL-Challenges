-- Intuit Consecutive Filing Years --

SELECT 
  user_id
FROM filed_taxes
WHERE product LIKE ('TurboTax%')
GROUP BY user_id
HAVING COUNT(product) >= 3
ORDER BY user_id;
