-- Accenture - Compensation Outliers --

WITH payout AS (
  SELECT 
    employee_id,
    salary,
    CASE WHEN salary > (AVG(salary) OVER(PARTITION BY title)) * 2 THEN 'Overpaid'
      WHEN salary < (AVG(salary) OVER(PARTITION BY title)) / 2 THEN 'Underpaid'
    END AS status
  FROM employee_pay
)

SELECT *
FROM payout
WHERE status IS NOT NULL;
