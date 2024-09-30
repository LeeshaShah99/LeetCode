# Write your MySQL query statement below
SELECT e.reports_to AS employee_id, f.name, COUNT(f.employee_id) AS reports_count, ROUND(AVG(e.age)) AS average_age
FROM Employees e
JOIN Employees f
ON e.reports_to = f.employee_id
WHERE e.reports_to IS NOT NULL
GROUP BY e.reports_to, f.name
ORDER BY e.reports_to