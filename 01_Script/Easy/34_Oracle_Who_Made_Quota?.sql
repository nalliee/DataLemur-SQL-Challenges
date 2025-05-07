-- Oracle Who Made Quota? --

SELECT 
  d.employee_id,
  CASE WHEN SUM(d.deal_size) > s.quota THEN 'yes' ELSE 'no' END AS made_quota
FROM sales_quotas AS s
INNER JOIN deals AS d
  ON s.employee_id = d.employee_id
GROUP BY d.employee_id, s.quota
ORDER BY d.employee_id;
