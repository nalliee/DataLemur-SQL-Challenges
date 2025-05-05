-- UnitedHealth Patient Support Analysis --

WITH call_history AS (
  SELECT
    policy_holder_id,
    call_date AS current_call,
    LEAD(call_date) OVER (
      PARTITION BY policy_holder_id
      ORDER BY call_date) AS next_call
  FROM callers
)

SELECT COUNT(DISTINCT policy_holder_id) AS policy_holder_count
FROM call_history
WHERE current_call + INTERVAL '7 days' >= next_call;
