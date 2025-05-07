-- LinkedIn Power Creators (Part 2) --

SELECT 
  p.profile_id
FROM personal_profiles AS p
LEFT JOIN employee_company AS e
  ON p.profile_id = e.personal_profile_id
LEFT JOIN company_pages AS c
  ON e.company_id = c.company_id
GROUP BY p.profile_id, p.followers
HAVING p.followers > MAX(c.followers)
ORDER BY p.profile_id;
