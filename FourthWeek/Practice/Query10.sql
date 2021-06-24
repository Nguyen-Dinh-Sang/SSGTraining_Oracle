SELECT PB AS "Phòng Ban",
        MNV AS "Mã Nhân Viên",
        HTNV AS "Họ Tên Nhân Viên",
        QL AS "Quản Lý",
        LUONG AS "Lương"
FROM (((SELECT  MA_NHAN_VIEN AS "MNV",
                HO || ' ' || DEM || ' ' || TEN AS "HTNV",
                PRIOR (HO || ' ' || DEM || ' ' || TEN) AS "QL",
                NHAN_VIEN_ID
        FROM NHAN_VIEN
        CONNECT BY PRIOR NHAN_VIEN_ID = QUAN_LY_ID
        START WITH MA_NHAN_VIEN = 'SSG004')
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
        ON NHAN_VIEN_ID = NVID2)
ORDER BY MNV;

-- Danh sách nhân viên của quản lý
SELECT  MA_NHAN_VIEN AS "Mã Nhân Viên",
        HO || ' ' || DEM || ' ' || TEN AS "Họ Tên Nhân Viên",
        PRIOR (HO || ' ' || DEM || ' ' || TEN) AS "Người Quản Lý"
FROM NHAN_VIEN
CONNECT BY PRIOR NHAN_VIEN_ID = QUAN_LY_ID
START WITH MA_NHAN_VIEN = 'SSG004';

-- Tạo cột ngoài bảng.
SELECT LUONG, 'VND' AS "Currency"
FROM LUONG