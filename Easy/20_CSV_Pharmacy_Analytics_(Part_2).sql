-- CSV Pharmacy Analytics (Part 2) --

SELECT
  manufacturer,
  COUNT(drug) AS drug_count,
  SUM(ABS(total_sales - cogs)) AS total_loss
FROM pharmacy_sales
WHERE total_sales - cogs <= 0
GROUP BY manufacturer
ORDER BY total_loss DESC;
