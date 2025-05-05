-- FAANG Well Paid Employees --

SELECT
  e.employee_id AS employee_id,
  e.name AS employee_name
FROM employee AS e
INNER JOIN employee AS m
  ON e.manager_id = m.employee_id
WHERE e.salary > m.salary;
