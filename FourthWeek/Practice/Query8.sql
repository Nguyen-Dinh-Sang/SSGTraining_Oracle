SELECT  PB AS "Phòng Ban",
        MA_NHAN_VIEN AS "Mã Nhân Viên",
        HTNV AS "Họ Tên Nhân Viên",
        LUONG AS "Mức Lương",
        NQL AS "Người Quản Lý",
        SUM(LUONG) OVER (PARTITION BY PB) AS "Tổng Lương Phòng",
        ROUND(LUONG / SUM(LUONG) OVER (PARTITION BY PB) * 100) || '%' AS "Tỷ Lệ Lương"
FROM (((SELECT MA_NHAN_VIEN, 
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
                                        FROM NHAN_VIEN_PHONG_BAN
                                        WHERE PHONG_BAN_TU_NGAY <= SYSDATE 
                                                AND PHONG_BAN_DEN_NGAY IS NULL 
                                                OR PHONG_BAN_DEN_NGAY > SYSDATE)
                            ON PHONG_BAN_ID = PBID))
        ON NHAN_VIEN_ID = NVID)
        LEFT JOIN (SELECT NHAN_VIEN_ID AS "NVID3",
                            LUONG
                    FROM LUONG
                    WHERE LUONG_TU_NGAY <= SYSDATE 
                            AND LUONG_DEN_NGAY IS NULL 
                            OR LUONG_DEN_NGAY > SYSDATE)
        ON NHAN_VIEN_ID = NVID3);