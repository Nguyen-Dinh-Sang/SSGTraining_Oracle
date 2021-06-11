-- If - Else
-- CASE
SELECT EMPLOYEE_NAME,
    CASE
        WHEN SALARY > 500000 THEN 'Lương cao hơn'
        WHEN SALARY > 200000 THEN 'Lương cao' 
    ELSE 'Lương thấp'
    END AS "Test If Else"
FROM EMPLOYEE;

SELECT EMPLOYEE_NAME,
    CASE 
        WHEN DEPARTMENT = 'ERP' THEN 'E R P'
        WHEN DEPARTMENT = 'FSA' THEN 'F S A'
        ELSE 'NULL'
    END AS "Test If Else"
FROM EMPLOYEE;

-- DECODE
SELECT EMPLOYEE_NAME,
    DECODE(DEPARTMENT,
        'ERP', 'E R P',
        'FSA', 'F S A',
        'NULL'
    ) AS "Decode"
FROM EMPLOYEE;

SELECT *
FROM EMPLOYEE;