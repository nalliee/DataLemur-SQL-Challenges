-- PayPal Unique Money Transfer Relationships --

WITH relationships AS (
  SELECT payer_id, recipient_id
  FROM payments
  INTERSECT
  SELECT recipient_id, payer_id
  FROM payments
)

SELECT COUNT(payer_id) / 2
FROM relationships;
