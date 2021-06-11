-- Cont 1.
-- Character.
SELECT LOWER('ORACLE')
FROM DUAL;

SELECT UPPER('oracle')
FROM DUAL;

-- Hoa các chữ đầu chữ sau viết thường.
SELECT INITCAP('LEARN ORACLE')
FROM DUAL;

-- Nối 2 chuỗi.
SELECT CONCAT('Oracle', ' Backup')
FROM DUAL;

-- Cắt chuỗi ('', từ vị trí, số ký tự).
SELECT SUBSTR('ORACLE DATA RECOVERY', 8, 4)
FROM DUAL;

SELECT SUBSTR('ORACLE DATA PUMP', 8)
FROM DUAL;

-- Cắt 6 ký tự cuối.
SELECT SUBSTR('ORACLE BACKUP', -6)
FROM DUAL;

SELECT LENGTH('Oracle Data Guard')
FROM DUAL;

-- Tìm kiếm vị trí chuỗi trong một chuỗi khác
-- INSTR('data', 'key', vị trí bắt đầu tìm, lần xuất hiện) mặc định vị trí và lần xuất hiện là 1
SELECT INSTR('oralce apps', 'app')
FROM DUAL;

SELECT INSTR('oralce apps is a great application', 'app', 1, 2)
FROM DUAL;

-- Đệm thêm ký tự x vào bên TRÁI 100 cho đến khi dài bằng 5
SELECT LPAD('100', 5, 'x')
FROM DUAL;

-- Đệm thêm ký tự x vào bên PHẢI 100 cho đến khi dài bằng 5
SELECT RPAD('100', 5, 'x')
FROM DUAL;

-- Cắt ký tự đầu, cuối, cả hai LEADING, TRAILING, BOTH
SELECT TRIM(TRAILING 'E' FROM 'EORACLEEE')
FROM DUAL;

SELECT TRIM('   tech   ')
FROM DUAL;

SELECT TRIM(' ' FROM '   tech   ')
FROM DUAL;

-- REPLACE('Data', 'Dữ liệu cũ', 'Dữ liệu mới')
SELECT REPLAGE('ORACLE DATA BACKUP', 'DATA', 'DATABASE')
FROM DUAL;

-- Number
-- Làm tròn số
SELECT ROUND(123.67, 1)
FROM DUAL;

SELECT ROUND(123.67)
FROM DUAL;

-- Làm tròn số trước dấu ,
SELECT ROUND(125.67, -1)
FROM DUAL;

-- TRUNC cắt các giá trị thập phân
SELECT TRUNC(123.67, 1)
FROM DUAL;

SELECT TRUNC(125.67, -2)
FROM DUAL;

SELECT MOD(10, 6)
FROM DUAL;

SELECT 10/2.3
FROM DUAL;

-- Date

-- Sysdate trả về ngày giờ hiện tại của hệ thống.
SELECT SYSDATE
FROM DUAL;

-- Các phép tính
SELECT SYSDATE + 2 "Cộng ngày"
FROM DUAL;

SELECT SYSDATE - 3 "Trừ ngày"
FROM DUAL;

SELECT SYSDATE + 3/24 "Cộng thêm 3/24 giờ của một ngày"
FROM DUAL;

SELECT SYSDATE - 2/24 "Trừ đi 2/24 giờ của một ngày"
FROM DUAL;

-- Trả về số ngày
SELECT SYSDATE - DATE_OF_BIRTH "Trừ 2 ngày với nhau"
FROM EMPLOYEE; -- Không SYSDATE + DATE_OF_BIRTH

-- Số tháng giữa 2 ngày
SELECT MONTHS_BETWEEN(SYSDATE, DATE_OF_BIRTH)
FROM EMPLOYEE;

SELECT MONTHS_BETWEEN('01-JUL-2000', '23-JAN-2000')
FROM DUAL;

-- Cộng hoặc trừ số tháng trong lịch
SELECT ADD_MONTHS(SYSDATE,3)
FROM DUAL;

SELECT ADD_MONTHS(SYSDATE,-3)
FROM DUAL;

SELECT ADD_MONTHS('01-JUL-2000', 3)
FROM DUAL;

-- Tìm ngày tiếp theo của ngày trong tuần
SELECT NEXT_DAY(SYSDATE,'FRIDAY')
FROM DUAL;

SELECT NEXT_DAY(SYSDATE,5)
FROM DUAL;

SELECT NEXT_DAY('01-JUL-2000', 'FRIDAY')
FROM DUAL;

-- Ngày cuối cùng của tháng
SELECT LAST_DAY(SYSDATE)
FROM DUAL;

SELECT LAST_DAY('01-JUL-2000')
FROM DUAL;

-- Làm tròn
SELECT ROUND((SYSDATE),'MONTH')
FROM DUAL;

SELECT ROUND(SYSDATE,'YEAR')
FROM DUAL;

-- Cắt theo định dạng
SELECT TRUNC(SYSDATE,'MONTH')
FROM DUAL;

SELECT TRUNC(SYSDATE,'YEAR')
FROM DUAL;

-- Conversion
-- TO_CHAR
SELECT TO_CHAR(SALARY, '$999,999.00') AS "Lương"
FROM EMPLOYEE;

SELECT TO_CHAR(DATE_OF_BIRTH, 'fmDD Month yyyy')
FROM EMPLOYEE; 

-- TO_DATE

-- General
-- Null thì lấy sysdate
SELECT NVL(NULL, sysdate)
FROM EMPLOYEE;

SELECT NVL2(NULL, 'COMM + SAL', 'SAL')
FROM EMPLOYEE;

SELECT NULLIF(EMPLOYEE_NAME, EMPLOYEE_NAME)
FROM EMPLOYEE;

SELECT COALESCE(NULL, EMPLOYEE_NAME, NULL)
FROM EMPLOYEE;





