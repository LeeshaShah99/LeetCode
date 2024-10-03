# Write your MySQL query statement below
SELECT person_name
FROM
    (
        SELECT person_name,
        SUM(Weight) OVER (ORDER BY Turn) AS Total_weight
        FROM Queue
    )p
WHERE Total_weight<=1000 
ORDER BY Total_weight DESC LIMIT 1