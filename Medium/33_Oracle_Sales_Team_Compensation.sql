-- Oracle Sales Team Compensation --

SELECT 
  e.employee_id,
  CASE 
    WHEN e.quota < SUM(d.deal_size) THEN e.base + (e.commission * e.quota) + (e.commission * (SUM(d.deal_size) - e.quota) * e.accelerator) 
    ELSE e.base + (e.commission * SUM(d.deal_size)) END AS total_compensation
FROM employee_contract AS e
INNER JOIN deals AS d
  ON e.employee_id = d.employee_id
GROUP BY e.employee_id, e.quota, e.base, e.commission, e.accelerator
ORDER BY total_compensation DESC, e.employee_id;
