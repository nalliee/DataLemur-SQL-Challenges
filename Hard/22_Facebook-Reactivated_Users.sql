-- Facebook - Reactivated Users --

SELECT
  EXTRACT(MONTH FROM curr_month.login_date) AS mth,
  COUNT(DISTINCT curr_month.user_id) AS reactivated_users
FROM user_logins AS curr_month
WHERE NOT EXISTS (
  SELECT *
  FROM user_logins AS last_month
  WHERE curr_month.user_id = last_month.user_id
    AND EXTRACT(MONTH FROM curr_month.login_date) = 
    EXTRACT(MONTH FROM last_month.login_date + INTERVAL '1 month')
)
GROUP BY EXTRACT(MONTH FROM curr_month.login_date)
ORDER BY mth;
