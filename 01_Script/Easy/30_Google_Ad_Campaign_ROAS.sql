-- Google Ad Campaign ROAS --

SELECT 
  advertiser_id,
  ROUND((SUM(revenue) / SUM(spend))::DECIMAL, 2) AS ROAS 
FROM ad_campaigns
GROUP BY advertiser_id
ORDER BY advertiser_id;
