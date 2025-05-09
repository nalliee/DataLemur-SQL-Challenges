-- Microsoft Spare Server Capacity --

SELECT 
  d.datacenter_id,
  d.monthly_capacity - SUM(f.monthly_demand) AS spare_capacity
FROM datacenters AS d
INNER JOIN forecasted_demand AS f
  ON d.datacenter_id = f.datacenter_id
GROUP BY d.datacenter_id, d.monthly_capacity
ORDER BY d.datacenter_id;
