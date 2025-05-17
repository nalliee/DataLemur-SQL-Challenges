-- Accenture - Uniquely Staffed Consultants --

WITH single_client_consultant AS (
  SELECT c.client_name, e.employee_id,
  COUNT(c.client_name) OVER(
    PARTITION BY e.employee_id) AS total_consultants
  FROM employees AS e
  INNER JOIN consulting_engagements AS c
    ON e.engagement_id = c.engagement_id
  GROUP BY c.client_name, e.employee_id
  HAVING COUNT(DISTINCT c.client_name) = 1
)

SELECT 
  client_name,
  COUNT(DISTINCT employee_id) AS total_consultants,
  COUNT(CASE WHEN total_consultants <= 1 THEN employee_id END) AS single_client_consultants
FROM single_client_consultant
GROUP BY client_name;
