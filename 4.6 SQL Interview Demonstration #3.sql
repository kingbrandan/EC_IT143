SELECT 
    student_id,
    school_year,
    AVG(grade) AS average_gpa
FROM 
    gpa_history
WHERE 
    is_required = 'TRUE' -- or 1 / TRUE depending on data type
GROUP BY 
    student_id, 
    school_year
HAVING 
    AVG(grade) >= 3.5;