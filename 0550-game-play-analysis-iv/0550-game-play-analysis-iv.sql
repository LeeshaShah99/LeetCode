WITH FirstLogin AS (
    -- Find the first login date for each player
    SELECT player_id, MIN(event_date) AS first_login
    FROM Activity
    GROUP BY player_id
),
NextDayLogin AS (
    -- Find players who logged in the day after their first login
    SELECT A.player_id
    FROM Activity A
    JOIN FirstLogin FL ON A.player_id = FL.player_id
    WHERE A.event_date = DATE_ADD(FL.first_login, INTERVAL 1 DAY)
)
-- Calculate the fraction of players who logged in on the next day after their first login
SELECT 
    ROUND(COUNT(DISTINCT ND.player_id) / COUNT(DISTINCT FL.player_id), 2) AS fraction
FROM FirstLogin FL
LEFT JOIN NextDayLogin ND ON FL.player_id = ND.player_id;
