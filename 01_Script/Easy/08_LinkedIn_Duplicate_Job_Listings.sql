-- LinkedIn Duplicate Job Listings --

WITH summary AS (
  SELECT 
    company_id,
    title,
    description,
    COUNT(*) AS job_count
  FROM job_listings
  GROUP BY company_id, title, description
)

SELECT COUNT(DISTINCT company_id) AS duplicate_companies
FROM summary
WHERE job_count > 1;
