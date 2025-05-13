-- Bloomberg - FAANG Stock Monthly Change (Part 2) --

WITH cte AS (
  SELECT
    ticker,
    date,
    close,
    LAG(close) OVER(PARTITION BY ticker ORDER BY date) AS prev_mth_close
  FROM stock_prices
)

SELECT
  ticker,
  date,
  close,
  ROUND((close - prev_mth_close) / prev_mth_close * 100, 2) AS intermth_change_pct
FROM cte
ORDER BY ticker, date;
