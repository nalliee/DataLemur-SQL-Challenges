-- Microsoft Supercloud Customer --

WITH supercloud_cust AS (
  SELECT 
    c.customer_id,
    COUNT(DISTINCT p.product_category) AS product_count
  FROM customer_contracts AS c
  LEFT JOIN products AS p
    ON c.product_id = p.product_id
  GROUP BY c.customer_id
)

SELECT customer_id
FROM supercloud_cust
WHERE product_count = (
  SELECT COUNT(DISTINCT product_category) FROM products);
