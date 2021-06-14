-- Multiple row function.
-- Count.
SELECT COUNT(*) AS "Count *", COUNT(MANAGER) AS "Count manager", COUNT(1) AS "Count 1", COUNT(DISTINCT(DEPARTMENT)) AS "Count distinct"
FROM EMPLOYEE;

-- Max-Min.
SELECT MAX(SALARY) AS "Max Salary", MIN(SALARY) AS "Min Salary"
FROM EMPLOYEE;

-- Sum-AVG.
SELECT SUM(SALARY) AS "Sum Salary", ROUND(AVG(SALARY), 2) AS "Avg Salary"
FROM EMPLOYEE;

-- Chú ý.
SELECT ROUND(AVG(SALARY), 2)
FROM EMPLOYEE;

SELECT ROUND(AVG(NVL(SALARY, 0)))
FROM EMPLOYEE;

-- Group By, Having.
SELECT DEPARTMENT AS "Phòng", COUNT(employee_id) AS "Số Nhân Viên"
FROM EMPLOYEE
GROUP BY DEPARTMENT;

SELECT DEPARTMENT AS "Phòng", COUNT(employee_id) AS "Số Nhân Viên"
FROM EMPLOYEE
GROUP BY DEPARTMENT
HAVING DEPARTMENT != 'ERP';

-- Nestin group functions
-- Các group functions lồng vào nhau.

SELECT *
FROM EMPLOYEE;