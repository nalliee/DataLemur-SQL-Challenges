-- FAANG Department vs. Company Salary --

WITH company_salary AS (
  SELECT
    payment_date,
    AVG(amount) AS co_avg_salary
  FROM salary
  WHERE payment_date = '03/31/2024 00:00:00'
  GROUP BY payment_date
),
dept_salary AS (
  SELECT
    e.department_id,
    s.payment_date,
    AVG(amount) AS dept_avg_salary
  FROM salary AS s
  INNER JOIN employee AS e
    ON s.employee_id = e.employee_id
  WHERE s.payment_date = '03/31/2024 00:00:00'
  GROUP BY e.department_id, s.payment_date
)

SELECT 
  d.department_id,
  TO_CHAR(c.payment_date, 'MM-YYYY') AS payment_date,
  CASE
    WHEN d.dept_avg_salary < c.co_avg_salary THEN 'lower'
    WHEN d.dept_avg_salary > c.co_avg_salary THEN 'higher'
  END AS comparison
FROM company_salary AS c
INNER JOIN dept_salary AS d
  ON c.payment_date = d.payment_date;
