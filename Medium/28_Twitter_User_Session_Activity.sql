-- Twitter User Session Activity --

SELECT
  user_id,
  session_type,
  RANK() OVER(
    PARTITION BY session_type
    ORDER BY SUM(duration) DESC) AS ranking
FROM sessions
WHERE start_date BETWEEN '01/01/2022'
  AND '02/01/2022'
GROUP BY user_id, session_type;
