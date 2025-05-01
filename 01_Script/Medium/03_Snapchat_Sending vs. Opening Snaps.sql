-- Snapchat Sending vs. Opening Snaps --

SELECT 
  age.age_bucket,
  ROUND(100.0 *
  SUM(atv.time_spent) FILTER (WHERE atv.activity_type = 'send') /
  SUM(atv.time_spent), 2) AS send_perc,
  ROUND(100.0 *
  SUM(atv.time_spent) FILTER (WHERE atv.activity_type = 'open') /
  SUM(atv.time_spent), 2) AS open_perc
FROM activities AS atv
INNER JOIN age_breakdown AS age
  ON atv.user_id = age.user_id
WHERE atv.activity_type IN ('send', 'open')
GROUP BY age.age_bucket;
