WITH RankedEmployees AS (
    SELECT 
        employee_id,
        employee_name,
        department_id,
        employee_salary,
        DENSE_RANK() OVER (
            PARTITION BY department_id 
            ORDER BY employee_salary DESC
        ) AS salary_rank
    FROM 
        employee_salary
)
SELECT 
    employee_id,
    employee_name,
    department_id,
    employee_salary
FROM 
    RankedEmployees
WHERE 
    salary_rank <= 3
ORDER BY 
    department_id, 
    salary_rank;