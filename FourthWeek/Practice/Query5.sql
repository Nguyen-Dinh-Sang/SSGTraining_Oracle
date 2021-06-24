INSERT INTO LUONG(NHAN_VIEN_ID, LUONG_TU_NGAY, LUONG)
SELECT NHAN_VIEN_ID, TO_DATE('01-10-2019', 'dd-mm-yyyy'), LUONG + LUONG * 0.3
FROM LUONG
WHERE NHAN_VIEN_ID IN (SELECT QUAN_LY_ID
                        FROM NHAN_VIEN
                        GROUP BY (QUAN_LY_ID)
                        HAVING QUAN_LY_ID IS NOT NULL);

-- Trigger update lương đến ngày khi thêm lương mới.
-- Dùng after nhưng không được
CREATE OR REPLACE TRIGGER UPDATE_LUONG_DEN_NGAY
BEFORE INSERT ON LUONG
FOR EACH ROW
BEGIN
    UPDATE LUONG
    SET LUONG_DEN_NGAY = :NEW.LUONG_TU_NGAY
    WHERE LUONG_ID = (SELECT LUONG_ID AS "LID"
                        FROM LUONG
                        WHERE LUONG_TU_NGAY < :NEW.LUONG_TU_NGAY
                                AND LUONG_DEN_NGAY IS NULL
                                AND NHAN_VIEN_ID = :NEW.NHAN_VIEN_ID);
END;

-- Test trigger
INSERT INTO LUONG (NHAN_VIEN_ID, LUONG_TU_NGAY, LUONG)
VALUES (8, TO_DATE('01-10-2019', 'dd-mm-yyyy'), 10000);

SELECT *
FROM LUONG
ORDER BY nhan_vien_id;

-- Danh sách quản lý
SELECT QUAN_LY_ID
FROM NHAN_VIEN
GROUP BY (QUAN_LY_ID)
HAVING QUAN_LY_ID IS NOT NULL;