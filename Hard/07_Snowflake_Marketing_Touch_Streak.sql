-- Snowflake Marketing Touch Streak --

WITH consecutive_week_cte AS (
  SELECT
    contact_id,
    event_date,
    LAG(DATE_TRUNC('week', event_date)) OVER (
      PARTITION BY contact_id ORDER BY event_date) AS lag_week,
    DATE_TRUNC('week', event_date) AS event_week,
    LEAD(DATE_TRUNC('week', event_date)) OVER (
      PARTITION BY contact_id ORDER BY event_date) AS lead_week
  FROM marketing_touches
)

SELECT DISTINCT email
FROM consecutive_week_cte AS events
INNER JOIN crm_contacts AS contacts
  ON events.contact_id = contacts.contact_id
WHERE events.lag_week = events.event_week - INTERVAL '1 week'
  OR events.lead_week = events.event_week + INTERVAL '1 week'
  AND events.contact_id IN (
    SELECT contact_id
    FROM marketing_touches
    WHERE event_type = 'trial_request'
);
