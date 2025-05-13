-- Bloomberg - FAANG Underperforming Stocks (Part 3) --

WITH cte AS (
  SELECT 
    ticker,
    date,
    CASE WHEN open - LAG(open) OVER(PARTITION BY ticker ORDER BY date) > 0 THEN 1 ELSE 0 END AS gains
  FROM stock_prices
)
, cte2 AS (
  SELECT 
    *,
    SUM(gains) OVER(PARTITION BY date) AS total_gains
  FROM cte
)

SELECT 
  TO_CHAR(date, 'Mon-YYYY') AS mth_yr,
  ticker AS underperforming_stock
FROM cte2
WHERE total_gains = 5 
  AND gains = 0
ORDER BY mth_yr;
