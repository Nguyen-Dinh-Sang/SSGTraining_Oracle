-- Cont 1.
-- Character.
SELECT LOWER('ORACLE') FROM DUAL;

SELECT UPPER('oracle') FROM DUAL;

-- Hoa chữ đầu chữ sau viết thường.
SELECT INITCAP('LEARN ORACLE') FROM DUAL;

-- Nối 2 chuỗi.
SELECT CONCAT('Oracle',' Backup') FROM DUAL;

-- Cắt chuỗi ('', từ vị trí, số ký tự).
SELECT SUBSTR('ORACLE DATA RECOVERY',8,4) FROM DUAL;
SELECT SUBSTR('ORACLE DATA PUMP',8) FROM DUAL;

-- Cắt 6 ký tự cuối.
SELECT SUBSTR('ORACLE BACKUP', -6) FROM DUAL;

SELECT LENGTH('Oracle Data Guard') FROM DUAL;

-- Tìm kiếm vị trí chuỗi trong một chuỗi khác
-- INSTR('data', 'key', vị trí bắt đầu tìm, lần xuất hiện) mặc định vị trí và lần xuất hiện là 1
SELECT INSTR('oralce apps','app') FROM DUAL;
SELECT INSTR('oralce apps is a great application','app',1,2) FROM DUAL;

-- Đệm thêm ký tự x vào bên TRÁI 100 cho đến khi dài bằng 5
SELECT LPAD('100',5,'x') FROM DUAL;

-- Đệm thêm ký tự x vào bên PHẢI 100 cho đến khi dài bằng 5
SELECT RPAD('100',5,'x') FROM DUAL;

-- Cắt ký tự đầu, cuối, cả hai LEADING, TRAILING, BOTH
SELECT TRIM(TRAILING 'E' FROM 'EORACLEEE') FROM DUAL;

SELECT TRIM('   tech   ') FROM DUAL;

SELECT TRIM(' ' FROM '   tech   ') FROM DUAL;

-- REPLACE('Data', 'Dữ liệu cũ', 'Dữ liệu mới')
SELECT replace('ORACLE DATA BACKUP', 'DATA','DATABASE') FROM DUAL;

-- Number
-- Làm tròn số
SELECT ROUND(123.67,1) FROM DUAL;
SELECT ROUND(123.67) FROM DUAL;

-- Làm tròn số trước dấu ,
SELECT ROUND(125.67,-1) FROM DUAL;

-- TRUNC cắt các giá trị thập phân
SELECT trunc(123.67,1) FROM DUAL;
SELECT trunc(125.67, -2) FROM DUAL;

SELECT MOD(10,6) FROM DUAL;
SELECT 10/2.3 FROM DUAL;

-- Date
