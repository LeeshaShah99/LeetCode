# Write your MySQL query statement below
# select Employee.name,Bonus.bonus from Employee left join Bonus on Employee.empId = Bonus.empId where bonus < 1000 and bonus is null

SELECT e.name, b.bonus
FROM Employee e
LEFT JOIN Bonus b ON e.empId = b.empId
WHERE b.bonus IS NULL OR b.bonus < 1000;

#check always logical operators.