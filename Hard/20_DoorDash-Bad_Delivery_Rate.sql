-- DoorDash - Bad Delivery Rate --

SELECT 
  ROUND(100.0 * 
    COUNT(*) FILTER(WHERE status IN ('completed incorrectly', 'never received')) 
    / COUNT(*), 2) AS bad_experience_pct
FROM orders AS o
INNER JOIN customers AS c
  USING(customer_id)
WHERE c.signup_timestamp BETWEEN '06/01/2022' AND '06/30/2022'
  AND o.order_timestamp < c.signup_timestamp + INTERVAL '2 weeks';
