-- Câu 3
SELECT ROWNUM AS "STT",
        PB AS "Phòng Ban",
        MA_NHAN_VIEN AS "Mã Nhân Viên",
        HTNV AS "Họ Tên Nhân Viên",
        CV AS "Chức Vụ",
        NQL AS "Người Quản Lý",
        LUONG AS "Mức Lương",
        TO_CHAR(NGAY_SINH, 'fmDD/MM/yyyy') AS "Ngày Sinh"
FROM ((((SELECT MA_NHAN_VIEN, 
                HO || ' ' || DEM || ' ' || TEN AS "HTNV",
                NQL,
                NGAY_SINH,
                NHAN_VIEN_ID
        FROM (NHAN_VIEN
                LEFT JOIN (SELECT  NHAN_VIEN_ID AS "NVID",
                                    CONNECT_BY_ROOT (HO || ' ' || DEM || ' ' || TEN) AS "NQL"
                            FROM NHAN_VIEN
                            WHERE LEVEL = 2
                            CONNECT BY PRIOR NHAN_VIEN_ID = QUAN_LY_ID)
                ON NHAN_VIEN_ID = NVID))
        LEFT JOIN (SELECT NVID, 
                    TEN_PHONG_BAN AS "PB"
                    FROM (PHONG_BAN
                            INNER JOIN (SELECT NHAN_VIEN_ID AS "NVID",
                                                PHONG_BAN_ID AS "PBID"
                                        FROM (NHAN_VIEN_PHONG_BAN
                                                INNER JOIN (SELECT NHAN_VIEN_ID AS NVID,
                                                                    MAX(PHONG_BAN_TU_NGAY) AS NGAY
                                                            FROM NHAN_VIEN_PHONG_BAN
                                                            GROUP BY NHAN_VIEN_ID)
                                                ON NHAN_VIEN_ID = NVID AND PHONG_BAN_TU_NGAY = NGAY))
                            ON PHONG_BAN_ID = PBID))
        ON NHAN_VIEN_ID = NVID)
        LEFT JOIN (SELECT NVID2, 
                            TEN_CHUC_VU AS "CV"
                    FROM (CHUC_VU
                            INNER JOIN (SELECT NHAN_VIEN_ID AS "NVID2", 
                                                CHUC_VU_ID AS "CVID"
                                        FROM (NHAN_VIEN_CHUC_VU
                                                INNER JOIN (SELECT NHAN_VIEN_ID AS NVID,
                                                                    MAX(CHUC_VU_TU_NGAY) AS NGAY
                                                            FROM NHAN_VIEN_CHUC_VU
                                                            GROUP BY NHAN_VIEN_ID)
                                                ON NHAN_VIEN_ID = NVID AND CHUC_VU_TU_NGAY = NGAY))
                            ON CHUC_VU_ID = CVID))
        ON NHAN_VIEN_ID = NVID2)
        LEFT JOIN (SELECT NHAN_VIEN_ID AS "NVID3", 
                        LUONG
                    FROM (LUONG
                    INNER JOIN (SELECT NHAN_VIEN_ID AS NVID, 
                                        MAX(LUONG_TU_NGAY) AS NGAY
                                FROM LUONG
                                GROUP BY NHAN_VIEN_ID)
                    ON NHAN_VIEN_ID = NVID AND LUONG_TU_NGAY = NGAY))
        ON NHAN_VIEN_ID = NVID3);

-- Tên chức vụ hiện tại của nhân viên
SELECT NVID, 
        TEN_CHUC_VU AS "CV"
FROM (CHUC_VU
        INNER JOIN (SELECT NHAN_VIEN_ID AS "NVID", 
                            CHUC_VU_ID AS "CVID"
                    FROM (NHAN_VIEN_CHUC_VU
                            INNER JOIN (SELECT NHAN_VIEN_ID AS NVID,
                                                MAX(CHUC_VU_TU_NGAY) AS NGAY
                                        FROM NHAN_VIEN_CHUC_VU
                                        GROUP BY NHAN_VIEN_ID)
                            ON NHAN_VIEN_ID = NVID AND CHUC_VU_TU_NGAY = NGAY))
        ON CHUC_VU_ID = CVID);

-- Tên phòng ban hiện tại của nhân viên.
SELECT NVID, TEN_PHONG_BAN AS "PB"
FROM (PHONG_BAN
        INNER JOIN (SELECT NHAN_VIEN_ID AS "NVID", PHONG_BAN_ID AS "PBID"
                    FROM (NHAN_VIEN_PHONG_BAN
                            INNER JOIN (SELECT NHAN_VIEN_ID AS NVID, MAX(PHONG_BAN_TU_NGAY) AS NGAY
                                        FROM NHAN_VIEN_PHONG_BAN
                                        GROUP BY NHAN_VIEN_ID)
                            ON NHAN_VIEN_ID = NVID AND PHONG_BAN_TU_NGAY = NGAY))
        ON PHONG_BAN_ID = PBID);

-- Phòng ban hiện tại của nhân viên.
SELECT NHAN_VIEN_ID AS "NVID", PHONG_BAN_ID
FROM (NHAN_VIEN_PHONG_BAN
    INNER JOIN (SELECT NHAN_VIEN_ID AS NVID, MAX(PHONG_BAN_TU_NGAY) AS NGAY
                                        FROM NHAN_VIEN_PHONG_BAN
                                        GROUP BY NHAN_VIEN_ID)
    ON NHAN_VIEN_ID = NVID AND PHONG_BAN_TU_NGAY = NGAY);

-- Lương nhân viên.
SELECT NHAN_VIEN_ID AS "NVID", LUONG
FROM (LUONG
    INNER JOIN (SELECT NHAN_VIEN_ID AS NVID, MAX(LUONG_TU_NGAY) AS NGAY
                                        FROM LUONG
                                        GROUP BY NHAN_VIEN_ID)
    ON NHAN_VIEN_ID = NVID AND LUONG_TU_NGAY = NGAY);
    
-- Lương hiện tại của nhân viên.
SELECT NHAN_VIEN_ID AS NVID, MAX(LUONG_TU_NGAY) AS NGAY
                                        FROM LUONG
                                        GROUP BY NHAN_VIEN_ID;
                                        
-- Danh sách nhân viên và quản lý.
SELECT MA_NHAN_VIEN, 
        HO || ' ' || DEM || ' ' || TEN AS "HTNV",
        NQL,
        NGAY_SINH
FROM (NHAN_VIEN
      LEFT JOIN (   SELECT  NHAN_VIEN_ID AS "NVID",
                            CONNECT_BY_ROOT (HO || ' ' || DEM || ' ' || TEN) AS "NQL"
                    FROM NHAN_VIEN
                    WHERE LEVEL = 2
                    CONNECT BY PRIOR NHAN_VIEN_ID = QUAN_LY_ID)
     ON NHAN_VIEN_ID = NVID);

-- Danh sách nhân viên có người quản lý.
SELECT  MA_NHAN_VIEN AS "Mã Nhân Viên",
        HO || ' ' || DEM || ' ' || TEN AS "Họ Tên Nhân Viên",
        CONNECT_BY_ROOT (HO || ' ' || DEM || ' ' || TEN) AS "Người Quản Lý",
        TO_CHAR(NGAY_SINH, 'fmDD/MM/yyyy') AS "Ngày Sinh"
FROM NHAN_VIEN
WHERE LEVEL = 2
CONNECT BY PRIOR NHAN_VIEN_ID = QUAN_LY_ID;

SELECT MA_NHAN_VIEN, 
    QUAN_LY_ID,
    CONNECT_BY_ROOT  ma_nhan_vien
FROM NHAN_VIEN
Start  With nhan_vien_id = 2
CONNECT BY PRIOR nhan_vien_id  = quan_ly_id

order by nhan_vien_id;   