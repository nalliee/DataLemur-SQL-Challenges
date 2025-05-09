-- TikTok Second Day Confirmation --
  
SELECT e.user_id
FROM emails AS e
INNER JOIN texts AS t
  ON e.email_id = t.email_id
WHERE t.action_date = e.signup_date + INTERVAL '1 day'
  AND t.signup_action = 'Confirmed';
