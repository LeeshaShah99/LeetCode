SELECT 
    s.student_id,
    s.student_name,
    sub.subject_name,
    COALESCE(COUNT(e.subject_name), 0) AS attended_exams
FROM 
    Students s
CROSS JOIN 
    Subjects sub
LEFT JOIN 
    Examinations e 
    ON s.student_id = e.student_id AND sub.subject_name = e.subject_name
GROUP BY 
    s.student_id, sub.subject_name
ORDER BY 
    s.student_id, sub.subject_name;
    
# When you have to join 3 tables then the last table should be joined on both the tables's column
# When one value of table 1 needs to be join all the value of the second table then use cross join.
