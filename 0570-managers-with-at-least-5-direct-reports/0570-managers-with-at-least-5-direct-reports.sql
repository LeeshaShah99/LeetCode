# Write your MySQL query statement below
SELECT m.name
FROM Employee e
JOIN Employee m ON e.managerId = m.id
GROUP BY m.id, m.name
HAVING COUNT(e.id) >= 5;

#IF there is a more complex query then start writing the code as per the execution sequence 
