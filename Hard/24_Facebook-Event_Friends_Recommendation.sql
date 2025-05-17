-- Facebook - Event Friends Recommendation --

WITH private_event AS (
  SELECT user_id, event_id
  FROM event_rsvp
  WHERE attendance_status IN ('going', 'maybe')
    AND event_type = 'private'
)

SELECT
  f.user_a_id,
  f.user_b_id
FROM private_event AS e1
INNER JOIN private_event AS e2
  ON e1.user_id != e2.user_id
 AND e1.event_id = e2.event_id
INNER JOIN friendship_status AS f
  ON e1.user_id = f.user_a_id
 AND e2.user_id = f.user_b_id
WHERE f.status = 'not_friends'
GROUP BY f.user_a_id, f.user_b_id
HAVING COUNT(*) >= 2;
