SELECT id, COUNT(DISTINCT friend_id) AS num
FROM (
    -- Combine requester_id and accepter_id as friends for each person
    SELECT requester_id AS id, accepter_id AS friend_id
    FROM RequestAccepted
    UNION ALL
    SELECT accepter_id AS id, requester_id AS friend_id
    FROM RequestAccepted
) AS combined_friends
GROUP BY id
ORDER BY num DESC
LIMIT 1;
