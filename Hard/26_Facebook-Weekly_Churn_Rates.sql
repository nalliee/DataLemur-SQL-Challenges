-- Facebook - Weekly Churn Rates --

WITH june2022 AS (
  SELECT 
    EXTRACT(WEEK FROM signup_date) - EXTRACT(WEEK FROM DATE_TRUNC('Month', signup_date)) + 1 AS signup_week,
    CASE WHEN (last_login::DATE - signup_date::DATE) <= 28 THEN 1 ELSE NULL END AS churned_users,
    COUNT(user_id) OVER(
      PARTITION BY EXTRACT(WEEK FROM signup_date)) AS user_count
  FROM users
  WHERE EXTRACT(MONTH FROM signup_date) = 6
    AND EXTRACT(YEAR FROM signup_date) = 2022
)

SELECT
  signup_week,
  ROUND(100.0 * COUNT(churned_users) / COUNT(user_count), 2) AS churn_rate
FROM june2022
GROUP BY signup_week;
