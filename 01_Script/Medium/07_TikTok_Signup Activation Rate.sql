-- TikTok Signup Activation Rate --

SELECT 
  ROUND(COUNT(t.email_id)::DECIMAL
  / COUNT(DISTINCT e.email_id),2) AS activation_rate
FROM emails AS e
LEFT JOIN texts AS t
  ON e.email_id = t.email_id
 AND t.signup_action = 'Confirmed';
