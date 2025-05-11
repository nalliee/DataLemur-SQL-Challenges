-- Facebook Email Table Transformation --

SELECT 
  user_id,
  MAX(CASE WHEN email_type = 'personal' THEN email ELSE NULL END) AS personal,
  MAX(CASE WHEN email_type = 'business' THEN email ELSE NULL END) AS business,
  MAX(CASE WHEN email_type = 'recovery' THEN email ELSE NULL END) AS recovery
FROM users
GROUP BY user_id
ORDER BY user_id;
