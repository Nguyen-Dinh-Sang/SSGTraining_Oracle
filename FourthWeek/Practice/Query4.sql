SELECT ROWNUM AS "STT",
        PB AS "Phòng Ban",
        MA_NHAN_VIEN AS "Mã Nhân Viên",
        HO || ' ' || DEM || ' ' || TEN AS "Họ Tên Nhân Viên",
        CV AS "Chức Vụ",
        NQL AS "Người Quản Lý",
        LUONG AS "Mức Lương",
        TO_CHAR(NGAY_SINH, 'fmDD/MM/yyyy') AS "Ngày Sinh"
FROM ((((SELECT MA_NHAN_VIEN, 
                HO,
                DEM,
                TEN,
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
        LEFT JOIN (SELECT NVID2, 
                            TEN_CHUC_VU AS "CV"
                    FROM (CHUC_VU
                            INNER JOIN (SELECT NHAN_VIEN_ID AS "NVID2",
                                                CHUC_VU_ID AS "CVID"
                                        FROM NHAN_VIEN_CHUC_VU
                                        WHERE CHUC_VU_TU_NGAY <= SYSDATE 
                                                AND CHUC_VU_DEN_NGAY IS NULL 
                                                OR CHUC_VU_DEN_NGAY > SYSDATE)
                            ON CHUC_VU_ID = CVID))
        ON NHAN_VIEN_ID = NVID2)
        LEFT JOIN (SELECT NHAN_VIEN_ID AS "NVID3",
                            LUONG
                    FROM LUONG
                    WHERE LUONG_TU_NGAY <= SYSDATE 
                            AND LUONG_DEN_NGAY IS NULL 
                            OR LUONG_DEN_NGAY > SYSDATE)
        ON NHAN_VIEN_ID = NVID3)
WHERE LOWER(HO) = LOWER('vŨ') AND LUONG > 10000
ORDER BY NGAY_SINH;

-- Rút gọn
SELECT ROWNUM AS "STT",
        MA_NHAN_VIEN AS "Mã Nhân Viên",
        HO || ' ' || DEM || ' ' || TEN AS "Họ Tên Nhân Viên",
        TO_CHAR(NGAY_SINH, 'fmDD/MM/yyyy') AS "Ngày Sinh",
        LUONG AS "Mức Lương"
FROM (NHAN_VIEN
        LEFT JOIN (SELECT NHAN_VIEN_ID AS "NVID",
                            LUONG
                    FROM LUONG
                    WHERE LUONG_TU_NGAY <= SYSDATE 
                            AND LUONG_DEN_NGAY IS NULL 
                            OR LUONG_DEN_NGAY > SYSDATE)
        ON NHAN_VIEN_ID = NVID)
WHERE LOWER(HO) = LOWER('vŨ') AND LUONG > 10000
ORDER BY NGAY_SINH;