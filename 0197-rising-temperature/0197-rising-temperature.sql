# SELECT id
# FROM (
#     SELECT id,
#            recordDate,
#            temperature,
#            LAG(temperature) OVER (ORDER BY recordDate) AS prev_temperature
#     FROM Weather
# ) AS temp_comparison
# WHERE prev_temperature IS NOT NULL AND temperature > prev_temperature;

# NOTE: LAG DOES NOT HANDLE THE GAP BETWEEN TWO DATE. IT WILL JUST PICK THE PREV DATE FROM ROWS.

SELECT w1.id
FROM Weather w1, Weather w2
WHERE DATEDIFF(w1.recordDate, w2.recordDate) = 1 AND w1.temperature > w2.temperature;
