# Write your MySQL query statement below
SELECT DISTINCT num AS ConsecutiveNums
FROM (
    SELECT num,
    LAG(num) OVER (ORDER BY id) AS prev_num,
    LAG(num,2) OVER (ORDER BY id) AS prev_num_2
    FROM Logs
) subuery
WHERE num=prev_num AND num=prev_num_2