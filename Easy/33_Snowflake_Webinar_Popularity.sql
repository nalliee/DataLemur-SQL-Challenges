-- Snowflake Webinar Popularity --

SELECT 
  ROUND(100.0 * 
    SUM(CASE WHEN event_type = 'webinar' THEN 1 ELSE 0 END) / 
    COUNT(event_id), 0) AS webinar_pct
FROM marketing_touches
WHERE EXTRACT(MONTH FROM event_date) = 4;
