-- Amazon Cumulative Purchases by Product Type --

SELECT 
  order_date,
  product_type,
  SUM(quantity) OVER(
    PARTITION BY product_type
    ORDER BY order_date) AS cum_purchased
FROM total_trans
ORDER BY order_date;
