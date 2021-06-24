SELECT PB AS "Phòng Ban",
        MNV AS "Mã Nhân Viên",
        HTNV AS "Họ Tên Nhân Viên",
        LUONG AS "Mức Lương",
        TLP AS "Tổng Lương Phòng",
        SNV AS "Số Nhân Viên Phòng",
        TBLP AS "Lương Trung Bình Phòng"
FROM TABLE(NHAN_VIEN_LUONG_HON_TB);

-- Tạo loại bản ghi
CREATE OR REPLACE TYPE TABLE_RECORD AS OBJECT (
     PB NVARCHAR2(10),
     MNV NVARCHAR2(10),
     HTNV NVARCHAR2(60),
     LUONG NUMBER(10,2),
     TLP NUMBER(10,2),
     SNV NUMBER(10,2),
     TBLP NUMBER(10,2)
);

-- Tạo loại bảng
CREATE OR REPLACE TYPE TYPE_TABLE AS TABLE OF TABLE_RECORD;

CREATE OR REPLACE FUNCTION NHAN_VIEN_LUONG_HON_TB
RETURN TYPE_TABLE
AS 
RESUTL TYPE_TABLE;
BEGIN  
    SELECT TABLE_RECORD(PB,
                        MA_NHAN_VIEN,
                        HTNV,
                        LUONG,
                        TLP,
                        SNV,
                        TBLP)
            BULK COLLECT INTO RESUTL
    FROM (SELECT PB,
                    MA_NHAN_VIEN,
                    HO || ' ' || DEM || ' ' || TEN AS "HTNV",
                    LUONG,
                    SUM(LUONG) OVER (PARTITION BY PB) AS "TLP",
                    COUNT(*) OVER (PARTITION BY PB) AS "SNV",
                    SUM(LUONG) OVER (PARTITION BY PB) / COUNT(*) OVER (PARTITION BY PB) AS "TBLP"
            FROM ((NHAN_VIEN
                    LEFT JOIN (SELECT NVID, 
                                        TEN_PHONG_BAN AS "PB"
                                FROM (PHONG_BAN
                                INNER JOIN (SELECT NHAN_VIEN_ID AS "NVID",
                                                    PHONG_BAN_ID AS "PBID"
                                            FROM NHAN_VIEN_PHONG_BAN
                                            WHERE PHONG_BAN_TU_NGAY <= SYSDATE 
                                                    AND PHONG_BAN_DEN_NGAY IS NULL 
                                                    OR PHONG_BAN_DEN_NGAY > SYSDATE)
                                ON PHONG_BAN_ID = PBID))
                    ON NHAN_VIEN_ID = NVID)
            LEFT JOIN (SELECT NHAN_VIEN_ID AS "NVID2",
                                LUONG
                        FROM LUONG
                        WHERE LUONG_TU_NGAY <= SYSDATE 
                                AND LUONG_DEN_NGAY IS NULL 
                                OR LUONG_DEN_NGAY > SYSDATE)
            ON NHAN_VIEN_ID = NVID2))
    WHERE LUONG > TBLP;
RETURN RESUTL;    
END;

-- Nhân viên có lương lớn hơn lương trung bình phòng
SELECT PB AS "Phòng Ban",
        MA_NHAN_VIEN AS "Mã Nhân Viên",
        HTNV AS "Họ Tên Nhân Viên",
        LUONG AS "Lương",
        TLP AS "Tổng Lương Phòng",
        SNV AS "Số Nhân Viên",
        TBLP AS "Trung Bình Lương Phòng"
FROM (SELECT PB,
            MA_NHAN_VIEN,
            HO || ' ' || DEM || ' ' || TEN AS "HTNV",
            LUONG,
            SUM(LUONG) OVER (PARTITION BY PB) AS "TLP",
            COUNT(*) OVER (PARTITION BY PB) AS "SNV",
            SUM(LUONG) OVER (PARTITION BY PB) / COUNT(*) OVER (PARTITION BY PB) AS "TBLP"
        FROM ((NHAN_VIEN
        LEFT JOIN (SELECT NVID, 
                    TEN_PHONG_BAN AS "PB"
                    FROM (PHONG_BAN
                            INNER JOIN (SELECT NHAN_VIEN_ID AS "NVID",
                                                PHONG_BAN_ID AS "PBID"
                                        FROM NHAN_VIEN_PHONG_BAN
                                        WHERE PHONG_BAN_TU_NGAY <= SYSDATE 
                                                AND PHONG_BAN_DEN_NGAY IS NULL 
                                                OR PHONG_BAN_DEN_NGAY > SYSDATE)
                            ON PHONG_BAN_ID = PBID))
        ON NHAN_VIEN_ID = NVID)
        LEFT JOIN (SELECT NHAN_VIEN_ID AS "NVID2",
                            LUONG
                    FROM LUONG
                    WHERE LUONG_TU_NGAY <= SYSDATE 
                            AND LUONG_DEN_NGAY IS NULL 
                            OR LUONG_DEN_NGAY > SYSDATE)
        ON NHAN_VIEN_ID = NVID2))
WHERE LUONG > TBLP;

-- Danh sách nhân viên phòng ban và lương
SELECT PB AS "Phòng Ban",
        MA_NHAN_VIEN AS "Mã Nhân Viên",
        HO || ' ' || DEM || ' ' || TEN AS "Họ Tên Nhân Viên",
        LUONG,
        SUM(LUONG) OVER (PARTITION BY PB) AS "Tổng Lương Phòng",
        COUNT(*) OVER (PARTITION BY PB) AS "Số Nhân Viên",
        SUM(LUONG) OVER (PARTITION BY PB) / COUNT(*) OVER (PARTITION BY PB) AS "Trung Bình Lương Phòng"
FROM ((NHAN_VIEN
        LEFT JOIN (SELECT NVID, 
                    TEN_PHONG_BAN AS "PB"
                    FROM (PHONG_BAN
                            INNER JOIN (SELECT NHAN_VIEN_ID AS "NVID",
                                                PHONG_BAN_ID AS "PBID"
                                        FROM NHAN_VIEN_PHONG_BAN
                                        WHERE PHONG_BAN_TU_NGAY <= SYSDATE 
                                                AND PHONG_BAN_DEN_NGAY IS NULL 
                                                OR PHONG_BAN_DEN_NGAY > SYSDATE)
                            ON PHONG_BAN_ID = PBID))
        ON NHAN_VIEN_ID = NVID)
        LEFT JOIN (SELECT NHAN_VIEN_ID AS "NVID2",
                            LUONG
                    FROM LUONG
                    WHERE LUONG_TU_NGAY <= SYSDATE 
                            AND LUONG_DEN_NGAY IS NULL 
                            OR LUONG_DEN_NGAY > SYSDATE)
        ON NHAN_VIEN_ID = NVID2);