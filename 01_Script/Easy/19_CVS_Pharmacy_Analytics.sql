-- CSV Pharmacy Analytics --

SELECT 
  drug,
  SUM(total_sales - cogs) AS total_profit 
FROM pharmacy_sales
GROUP BY drug
ORDER BY total_profit DESC
LIMIT 3;
