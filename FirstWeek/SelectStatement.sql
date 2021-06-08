-- Employee.
-- Cont 1 select basic.
SELECT *
FROM EMPLOYEE;

SELECT EMPLOYEE_NAME, JOB_POSITION
FROM EMPLOYEE
WHERE EMPLOYEE_ID = 2;

-- Cont 2 select: null, alias, ||.
SELECT EMPLOYEE_NAME, SALARY * NULL
FROM EMPLOYEE;

SELECT EMPLOYEE_NAME, SALARY + NULL AS ICOME
FROM EMPLOYEE;

SELECT EMPLOYEE_NAME AS NAME, DEPARTMENT AS DEP
FROM EMPLOYEE;
-->
SELECT EMPLOYEE_NAME || DEPARTMENT AS "NAME - DEP"
FROM EMPLOYEE;

-- Cont 3 literal character string, duplicate.
SELECT EMPLOYEE_NAME || ' is a ' || JOB_POSITION AS "NAME - JOB"
FROM EMPLOYEE;

-- Xử lý dấu nháy trong chuỗi bằng Quote.
SELECT EMPLOYEE_NAME || Q'[ Department's Manager] ' || MANAGER AS "NAME - MANAGER"
FROM EMPLOYEE;

-- X? l� d?u nh�y ??n trong chu?i b?ng 2 d?u nh�y ??n.
SELECT EMPLOYEE_NAME || ' Department''s Manager ' || MANAGER AS "NAME - MANAGER"
FROM EMPLOYEE;

--Distinct
SELECT DISTINCT EMPLOYEE_NAME
FROM EMPLOYEE;

-- Connt 4 describe
DESCRIBE EMPLOYEE;

DESC EMPLOYEE;
