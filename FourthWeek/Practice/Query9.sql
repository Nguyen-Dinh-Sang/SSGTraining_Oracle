SELECT  MA_NHAN_VIEN AS "Mã Nhân Viên",
        PB AS "Phòng Ban",
        HO || ' ' || DEM || ' ' || TEN AS "Họ Tên Nhân Viên",
        LUONG AS "Mức Lương"
FROM ((NHAN_VIEN
        LEFT JOIN (SELECT NHAN_VIEN_ID AS "NVID",
                            LUONG
                    FROM LUONG
                    WHERE LUONG_TU_NGAY <= SYSDATE 
                            AND LUONG_DEN_NGAY IS NULL 
                            OR LUONG_DEN_NGAY > SYSDATE)
        ON NHAN_VIEN_ID = NVID)
        LEFT JOIN (SELECT NVID2, 
                    TEN_PHONG_BAN AS "PB"
                    FROM (PHONG_BAN
                            INNER JOIN (SELECT NHAN_VIEN_ID AS "NVID2",
                                                PHONG_BAN_ID AS "PBID"
                                        FROM NHAN_VIEN_PHONG_BAN
                                        WHERE PHONG_BAN_TU_NGAY <= SYSDATE 
                                                AND PHONG_BAN_DEN_NGAY IS NULL 
                                                OR PHONG_BAN_DEN_NGAY > SYSDATE)
                            ON PHONG_BAN_ID = PBID))
        ON NHAN_VIEN_ID = NVID2),
        (SELECT PB AS "PB2",
                MAX(LUONG) AS "ML"
        FROM ((NHAN_VIEN
                LEFT JOIN (SELECT NHAN_VIEN_ID AS "NVID",
                                    LUONG
                            FROM LUONG
                            WHERE LUONG_TU_NGAY <= SYSDATE 
                                    AND LUONG_DEN_NGAY IS NULL 
                                    OR LUONG_DEN_NGAY > SYSDATE)
                ON NHAN_VIEN_ID = NVID)
                LEFT JOIN (SELECT NVID2, 
                                    TEN_PHONG_BAN AS "PB"
                            FROM (PHONG_BAN
                                    INNER JOIN (SELECT NHAN_VIEN_ID AS "NVID2",
                                                        PHONG_BAN_ID AS "PBID"
                                                FROM NHAN_VIEN_PHONG_BAN
                                                WHERE PHONG_BAN_TU_NGAY <= SYSDATE 
                                                        AND PHONG_BAN_DEN_NGAY IS NULL 
                                                        OR PHONG_BAN_DEN_NGAY > SYSDATE)
                                    ON PHONG_BAN_ID = PBID))
                ON NHAN_VIEN_ID = NVID2)
        GROUP BY PB)
WHERE PB = PB AND LUONG = ML;

-- Lương cao nhất các phòng
SELECT  PB,
        MAX(LUONG) AS "ML"
FROM ((NHAN_VIEN
        LEFT JOIN (SELECT NHAN_VIEN_ID AS "NVID",
                            LUONG
                    FROM LUONG
                    WHERE LUONG_TU_NGAY <= SYSDATE 
                            AND LUONG_DEN_NGAY IS NULL 
                            OR LUONG_DEN_NGAY > SYSDATE)
        ON NHAN_VIEN_ID = NVID)
        LEFT JOIN (SELECT NVID2, 
                    TEN_PHONG_BAN AS "PB"
                    FROM (PHONG_BAN
                            INNER JOIN (SELECT NHAN_VIEN_ID AS "NVID2",
                                                PHONG_BAN_ID AS "PBID"
                                        FROM NHAN_VIEN_PHONG_BAN
                                        WHERE PHONG_BAN_TU_NGAY <= SYSDATE 
                                                AND PHONG_BAN_DEN_NGAY IS NULL 
                                                OR PHONG_BAN_DEN_NGAY > SYSDATE)
                            ON PHONG_BAN_ID = PBID))
        ON NHAN_VIEN_ID = NVID2)
GROUP BY PB;

-- Danh sách nhân viên, phòng ban, lương.
SELECT  MA_NHAN_VIEN AS "Mã Nhân Viên",
        PB AS "Phòng Ban",
        HO || ' ' || DEM || ' ' || TEN AS "Họ Tên Nhân Viên",
        LUONG AS "Mức Lương"
FROM ((NHAN_VIEN
        LEFT JOIN (SELECT NHAN_VIEN_ID AS "NVID",
                            LUONG
                    FROM LUONG
                    WHERE LUONG_TU_NGAY <= SYSDATE 
                            AND LUONG_DEN_NGAY IS NULL 
                            OR LUONG_DEN_NGAY > SYSDATE)
        ON NHAN_VIEN_ID = NVID)
        LEFT JOIN (SELECT NVID2, 
                    TEN_PHONG_BAN AS "PB"
                    FROM (PHONG_BAN
                            INNER JOIN (SELECT NHAN_VIEN_ID AS "NVID2",
                                                PHONG_BAN_ID AS "PBID"
                                        FROM NHAN_VIEN_PHONG_BAN
                                        WHERE PHONG_BAN_TU_NGAY <= SYSDATE 
                                                AND PHONG_BAN_DEN_NGAY IS NULL 
                                                OR PHONG_BAN_DEN_NGAY > SYSDATE)
                            ON PHONG_BAN_ID = PBID))
        ON NHAN_VIEN_ID = NVID2);