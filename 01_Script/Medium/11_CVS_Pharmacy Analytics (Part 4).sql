-- CVS Pharmacy Analytics (Part 4) --

WITH top_drugs AS (
  SELECT
    manufacturer,
    drug,
    units_sold,
    ROW_NUMBER() OVER(
    PARTITION BY manufacturer
    ORDER BY units_sold DESC) AS drug_position
  FROM pharmacy_sales
)

SELECT
  manufacturer,
  drug
FROM top_drugs
WHERE drug_position <= 2
ORDER BY manufacturer;
