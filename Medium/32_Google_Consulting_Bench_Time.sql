-- Google Consulting Bench Time --

WITH cte AS (
  SELECT 
    s.employee_id,
    SUM(c.end_date - c.start_date) AS non_bench_days,
    COUNT(c.job_id) AS inclusive_days
  FROM staffing AS s
  INNER JOIN consulting_engagements AS c
    ON s.job_id = c.job_id
  WHERE s.is_consultant = 'true'
  GROUP BY s.employee_id
)

SELECT
  employee_id,
  365 - non_bench_days - inclusive_days AS bench_days
FROM cte
GROUP BY employee_id, non_bench_days, inclusive_days;
