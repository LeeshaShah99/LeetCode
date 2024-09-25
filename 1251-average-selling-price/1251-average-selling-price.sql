# Write your MySQL query statement below
SELECT p.product_id, ROUND(COALESCE(SUM(u.units * p.price)/ SUM(u.units) ,0), 2) AS average_price
FROM Prices p
LEFT JOIN UnitsSold u
ON p.product_id = u.product_id
AND u.purchase_date BETWEEN P.start_date AND P.end_date
GROUP BY p.product_id