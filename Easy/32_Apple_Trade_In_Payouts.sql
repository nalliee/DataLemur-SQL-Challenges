-- Apple Trade In Payouts --

SELECT 
  t.store_id,
  SUM(payout_amount) AS payout_total
FROM trade_in_transactions AS t
INNER JOIN trade_in_payouts AS p
  ON t.model_id = p.model_id
GROUP BY t.store_id
ORDER BY payout_total DESC;
