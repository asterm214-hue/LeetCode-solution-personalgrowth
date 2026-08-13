WITH first_login AS (
    SELECT player_id, MIN(event_date) AS first_date
    FROM Activity
    GROUP BY player_id
)
SELECT ROUND(
    SUM(CASE WHEN B.player_id IS NOT NULL THEN 1 ELSE 0 END) * 1.0
    / COUNT(A.player_id),
    2
) AS fraction
FROM first_login A
LEFT JOIN Activity B
    ON A.player_id = B.player_id
    AND DATE_ADD(A.first_date, INTERVAL 1 DAY) = B.event_date;