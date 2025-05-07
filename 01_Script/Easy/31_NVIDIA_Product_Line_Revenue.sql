-- NVIDIA Product Line Revenue --

SELECT 
  p.product_line,
  SUM(t.amount) AS total_revenue
FROM product_info AS p
INNER JOIN transactions AS t
  ON p.product_id = t.product_id
GROUP BY p.product_line
ORDER BY total_revenue DESC;
