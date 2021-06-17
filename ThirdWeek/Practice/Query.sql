 -- Câu 3 (STT chưa làm được).
 SELECT PB AS "Phòng Ban", MNV AS "Mã Nhân Viên", HTNV AS "Họ Tên Nhân Viên", CV AS "Chức Vụ", QL AS "Người Quản Lý", LUONG AS "Mức Lương", TO_CHAR(NS, 'fmDD/MM/yyyy') AS "Ngày Sinh"
 FROM (((   SELECT PHONG_BAN.TEN_PHONG_BAN AS "PB",
                    NHAN_VIEN.NHAN_VIEN_ID AS "MNV",
                    NHAN_VIEN.HO || ' ' || NHAN_VIEN.DEM || ' ' || NHAN_VIEN.TEN AS "HTNV",
                    CHUC_VU.TEN_CHUC_VU AS "CV",
                    NHAN_VIEN.NGAY_SINH AS "NS"
            FROM ((NHAN_VIEN
                    LEFT JOIN PHONG_BAN ON NHAN_VIEN.PHONG_BAN_ID = PHONG_BAN.PHONG_BAN_ID)
                    LEFT JOIN CHUC_VU ON NHAN_VIEN.CHUC_VU_ID = CHUC_VU.CHUC_VU_ID))
            LEFT JOIN (SELECT NHAN_VIEN_ID AS "NV", LUONG
                        FROM LUONG, (SELECT NHAN_VIEN_ID AS NVID, MAX(LUONG_TU_NGAY) AS NGAY
                                        FROM LUONG
                                        GROUP BY NHAN_VIEN_ID)
                        WHERE NHAN_VIEN_ID = NVID AND LUONG_TU_NGAY = NGAY) ON MNV = NV)
            LEFT JOIN (SELECT NHAN_VIEN.HO || ' ' || NHAN_VIEN.DEM || ' ' || NHAN_VIEN.TEN AS "QL", QUAN_LY.CAP_DUOI_ID
                        FROM (QUAN_LY
                            LEFT JOIN NHAN_VIEN ON NHAN_VIEN_ID = CAP_TREN_ID)) ON MNV = CAP_DUOI_ID)
ORDER BY MNV;
        
-- Câu 4.
SELECT HO || ' ' || DEM || ' ' || TEN AS "Họ Tên Nhân Viên", LUONG AS "Mức Lương", TO_CHAR(NGAY_SINH, 'fmDD/MM/yyyy') AS "Ngày Sinh"
FROM (NHAN_VIEN
        LEFT JOIN (SELECT NHAN_VIEN_ID AS "NV", LUONG
                    FROM LUONG, (SELECT NHAN_VIEN_ID AS NVID, MAX(LUONG_TU_NGAY) AS NGAY
                                    FROM LUONG
                                    GROUP BY NHAN_VIEN_ID)
                     WHERE NHAN_VIEN_ID = NVID AND LUONG_TU_NGAY = NGAY) ON NHAN_VIEN_ID = NV)
WHERE LOWER(HO) = LOWER('vŨ') AND LUONG > 10000
ORDER BY NGAY_SINH;

-- Câu 5.
INSERT INTO LUONG(LUONG_ID, NHAN_VIEN_ID, LUONG_TU_NGAY, LUONG)
-- cần sử lại để id tự tăng.
https://stackoverflow.com/questions/11296361/how-to-create-id-with-auto-increment-on-oracle

SELECT CAP_TREN_ID
FROM QUAN_LY
GROUP BY CAP_TREN_ID;
    
-- Lấy tên quản lý của mã nhân viên.
SELECT NHAN_VIEN.HO || ' ' || NHAN_VIEN.DEM || ' ' || NHAN_VIEN.TEN AS "QL"
FROM NHAN_VIEN
WHERE NHAN_VIEN_ID = (SELECT CAP_TREN_ID
                    FROM QUAN_LY
                    WHERE CAP_DUOI_ID = 'SSG2');

-- Danh sách quản lý của các nhân viên.                  
SELECT NHAN_VIEN.HO || ' ' || NHAN_VIEN.DEM || ' ' || NHAN_VIEN.TEN AS "QL", QUAN_LY.CAP_DUOI_ID
FROM (QUAN_LY
        LEFT JOIN NHAN_VIEN ON NHAN_VIEN_ID = CAP_TREN_ID);
     
-- Danh sách lương hiện tại của nhân viên.   
SELECT NHAN_VIEN_ID AS "NV", LUONG
FROM LUONG, (SELECT NHAN_VIEN_ID AS NVID, MAX(LUONG_TU_NGAY) AS NGAY
                        FROM LUONG
                        GROUP BY NHAN_VIEN_ID)
WHERE NHAN_VIEN_ID = NVID AND LUONG_TU_NGAY = NGAY;

-- Thông tin nhân viên cơ bản.
SELECT PHONG_BAN.TEN_PHONG_BAN AS "PB",
        NHAN_VIEN.NHAN_VIEN_ID AS "MNV",
        NHAN_VIEN.HO || ' ' || NHAN_VIEN.DEM || ' ' || NHAN_VIEN.TEN AS "HTNV",
        CHUC_VU.TEN_CHUC_VU AS "CV",
        NHAN_VIEN.NGAY_SINH AS "NS"
FROM ((NHAN_VIEN
    LEFT JOIN PHONG_BAN ON NHAN_VIEN.PHONG_BAN_ID = PHONG_BAN.PHONG_BAN_ID)
    LEFT JOIN CHUC_VU ON NHAN_VIEN.CHUC_VU_ID = CHUC_VU.CHUC_VU_ID)