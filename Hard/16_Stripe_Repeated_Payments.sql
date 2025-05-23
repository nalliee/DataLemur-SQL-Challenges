-- Stripe Repeated Payments --

WITH payments AS (
  SELECT
    transaction_id,
    merchant_id,
    credit_card_id,
    amount,
    transaction_timestamp,
    EXTRACT(EPOCH FROM transaction_timestamp - LAG(transaction_timestamp) OVER (
      PARTITION BY merchant_id, credit_card_id, amount
      ORDER BY transaction_timestamp)) / 60 AS minute_difference
  FROM transactions
)

SELECT COUNT(merchant_id) AS payment_count
FROM payments
WHERE minute_difference <= 10;
