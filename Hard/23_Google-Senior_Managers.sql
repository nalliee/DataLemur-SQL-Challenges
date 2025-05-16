-- Google - Senior Managers --

SELECT
  manager.manager_name,
  COUNT(DISTINCT manager.emp_id) AS direct_reportees
FROM employees
INNER JOIN employees AS manager
  ON employees.manager_id = manager.emp_id
INNER JOIN employees AS senior_manager
  ON manager.manager_id = senior_manager.emp_id
GROUP BY manager.manager_name
ORDER BY direct_reportees DESC;
