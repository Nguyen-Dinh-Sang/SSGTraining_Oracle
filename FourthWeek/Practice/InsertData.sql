-- Phòng ban
INSERT INTO PHONG_BAN (MA_PHONG_BAN, TEN_PHONG_BAN)
VALUES ('PB001', 'TEC');

INSERT INTO PHONG_BAN (MA_PHONG_BAN, TEN_PHONG_BAN)
VALUES ('PB002', 'ERP');

-- Chức vụ
INSERT INTO CHUC_VU (MA_CHUC_VU, TEN_CHUC_VU)
VALUES ('CV001', 'Nhân Viên');

-- Nhân viên
INSERT INTO NHAN_VIEN (NHAN_VIEN_ID, MA_NHAN_VIEN, HO, DEM, TEN, NGAY_SINH)
VALUES (1, 'SSG001', 'Nguyễn', 'Văn', 'A', TO_DATE('01-10-1999', 'dd-mm-yyyy'));

INSERT INTO NHAN_VIEN (NHAN_VIEN_ID, QUAN_LY_ID, MA_NHAN_VIEN, HO, DEM, TEN, NGAY_SINH)
VALUES (2, 1, 'SSG002', 'Nguyễn', 'Văn', 'B', TO_DATE('01-10-1999', 'dd-mm-yyyy'));

INSERT INTO NHAN_VIEN (NHAN_VIEN_ID, MA_NHAN_VIEN, HO, DEM, TEN, NGAY_SINH)
VALUES (3, 'SSG003', 'Nguyễn', 'Văn', 'C', TO_DATE('01-10-1999', 'dd-mm-yyyy'));

INSERT INTO NHAN_VIEN (NHAN_VIEN_ID, QUAN_LY_ID, MA_NHAN_VIEN, HO, DEM, TEN, NGAY_SINH)
VALUES (4, 3, 'SSG004', 'Nguyễn', 'Văn', 'D', TO_DATE('01-10-1999', 'dd-mm-yyyy'));

INSERT INTO NHAN_VIEN (NHAN_VIEN_ID, QUAN_LY_ID, MA_NHAN_VIEN, HO, DEM, TEN, NGAY_SINH)
VALUES (5, 4, 'SSG005', 'Nguyễn', 'Thị', 'E', TO_DATE('01-10-2018', 'dd-mm-yyyy'));

INSERT INTO NHAN_VIEN (NHAN_VIEN_ID, QUAN_LY_ID, MA_NHAN_VIEN, HO, DEM, TEN, NGAY_SINH)
VALUES (6, 5, 'SSG006', 'VŨ', 'Thị', 'F', TO_DATE('01-10-1998', 'dd-mm-yyyy'));

INSERT INTO NHAN_VIEN (NHAN_VIEN_ID, QUAN_LY_ID, MA_NHAN_VIEN, HO, DEM, TEN, NGAY_SINH)
VALUES (7, 1, 'SSG007', 'vũ', 'Văn', 'G', TO_DATE('01-10-2019', 'dd-mm-yyyy'));

INSERT INTO NHAN_VIEN (NHAN_VIEN_ID, MA_NHAN_VIEN, HO, DEM, TEN, NGAY_SINH)
VALUES (8, 'SSG008', 'Vũ', 'Tuấn', 'H', TO_DATE('01-08-1999', 'dd-mm-yyyy'));

-- Lương
INSERT INTO LUONG (NHAN_VIEN_ID, LUONG_TU_NGAY, LUONG)
VALUES (1, TO_DATE('01-10-2018', 'dd-mm-yyyy'), 10000);

INSERT INTO LUONG (NHAN_VIEN_ID, LUONG_TU_NGAY, LUONG_DEN_NGAY, LUONG)
VALUES (2, TO_DATE('01-10-2018', 'dd-mm-yyyy'), TO_DATE('01-10-2017', 'dd-mm-yyyy'), 10000);

INSERT INTO LUONG (NHAN_VIEN_ID, LUONG_TU_NGAY, LUONG)
VALUES (3, TO_DATE('01-10-2018', 'dd-mm-yyyy'), 11000);

INSERT INTO LUONG (NHAN_VIEN_ID, LUONG_TU_NGAY, LUONG)
VALUES (4, TO_DATE('01-10-2018', 'dd-mm-yyyy'), 10000);

INSERT INTO LUONG (NHAN_VIEN_ID, LUONG_TU_NGAY, LUONG)
VALUES (5, TO_DATE('01-10-2018', 'dd-mm-yyyy'), 8000);

INSERT INTO LUONG (NHAN_VIEN_ID, LUONG_TU_NGAY, LUONG_DEN_NGAY, LUONG)
VALUES (2, TO_DATE('01-10-2017', 'dd-mm-yyyy'), TO_DATE('01-10-2016', 'dd-mm-yyyy'), 9000);

INSERT INTO LUONG (NHAN_VIEN_ID, LUONG_TU_NGAY, LUONG)
VALUES (2, TO_DATE('01-10-2016', 'dd-mm-yyyy'), 8000);

INSERT INTO LUONG (NHAN_VIEN_ID, LUONG_TU_NGAY, LUONG_DEN_NGAY, LUONG)
VALUES (6, TO_DATE('01-10-2015', 'dd-mm-yyyy'), TO_DATE('01-10-2016', 'dd-mm-yyyy'), 1000);

INSERT INTO LUONG (NHAN_VIEN_ID, LUONG_TU_NGAY, LUONG)
VALUES (6, TO_DATE('01-10-2016', 'dd-mm-yyyy'), 20000);

INSERT INTO LUONG (NHAN_VIEN_ID, LUONG_TU_NGAY, LUONG)
VALUES (7, TO_DATE('01-10-2016', 'dd-mm-yyyy'), 30000);

INSERT INTO LUONG (NHAN_VIEN_ID, LUONG_TU_NGAY, LUONG_DEN_NGAY, LUONG)
VALUES (8, TO_DATE('01-10-2016', 'dd-mm-yyyy'), TO_DATE('01-10-2017', 'dd-mm-yyyy'), 100000);

INSERT INTO LUONG (NHAN_VIEN_ID, LUONG_TU_NGAY, LUONG)
VALUES (8, TO_DATE('01-10-2017', 'dd-mm-yyyy'), 8000);

-- Nhân viên - Chức vụ
INSERT INTO NHAN_VIEN_CHUC_VU (CHUC_VU_ID, NHAN_VIEN_ID, CHUC_VU_TU_NGAY)
VALUES (1, 1, TO_DATE('01-10-2015', 'dd-mm-yyyy'));

INSERT INTO NHAN_VIEN_CHUC_VU (CHUC_VU_ID, NHAN_VIEN_ID, CHUC_VU_TU_NGAY)
VALUES (1, 2, TO_DATE('01-10-2015', 'dd-mm-yyyy'));

INSERT INTO NHAN_VIEN_CHUC_VU (CHUC_VU_ID, NHAN_VIEN_ID, CHUC_VU_TU_NGAY)
VALUES (1, 3, TO_DATE('01-10-2015', 'dd-mm-yyyy'));

INSERT INTO NHAN_VIEN_CHUC_VU (CHUC_VU_ID, NHAN_VIEN_ID, CHUC_VU_TU_NGAY)
VALUES (1, 4, TO_DATE('01-10-2015', 'dd-mm-yyyy'));

INSERT INTO NHAN_VIEN_CHUC_VU (CHUC_VU_ID, NHAN_VIEN_ID, CHUC_VU_TU_NGAY)
VALUES (1, 5, TO_DATE('01-10-2015', 'dd-mm-yyyy'));

INSERT INTO NHAN_VIEN_CHUC_VU (CHUC_VU_ID, NHAN_VIEN_ID, CHUC_VU_TU_NGAY)
VALUES (1, 6, TO_DATE('01-10-2015', 'dd-mm-yyyy'));

INSERT INTO NHAN_VIEN_CHUC_VU (CHUC_VU_ID, NHAN_VIEN_ID, CHUC_VU_TU_NGAY)
VALUES (1, 7, TO_DATE('01-10-2015', 'dd-mm-yyyy'));

INSERT INTO NHAN_VIEN_CHUC_VU (CHUC_VU_ID, NHAN_VIEN_ID, CHUC_VU_TU_NGAY)
VALUES (1, 8, TO_DATE('01-10-2015', 'dd-mm-yyyy'));

-- Nhân viên - Phòng ban
INSERT INTO NHAN_VIEN_PHONG_BAN(PHONG_BAN_ID, NHAN_VIEN_ID, PHONG_BAN_TU_NGAY)
VALUES (1, 1, TO_DATE('01-10-2015', 'dd-mm-yyyy'));

INSERT INTO NHAN_VIEN_PHONG_BAN(PHONG_BAN_ID, NHAN_VIEN_ID, PHONG_BAN_TU_NGAY)
VALUES (1, 2, TO_DATE('01-10-2015', 'dd-mm-yyyy'));

INSERT INTO NHAN_VIEN_PHONG_BAN(PHONG_BAN_ID, NHAN_VIEN_ID, PHONG_BAN_TU_NGAY)
VALUES (2, 3, TO_DATE('01-10-2015', 'dd-mm-yyyy'));

INSERT INTO NHAN_VIEN_PHONG_BAN(PHONG_BAN_ID, NHAN_VIEN_ID, PHONG_BAN_TU_NGAY)
VALUES (2, 4, TO_DATE('01-10-2015', 'dd-mm-yyyy'));

INSERT INTO NHAN_VIEN_PHONG_BAN(PHONG_BAN_ID, NHAN_VIEN_ID, PHONG_BAN_TU_NGAY)
VALUES (2, 5, TO_DATE('01-10-2015', 'dd-mm-yyyy'));

INSERT INTO NHAN_VIEN_PHONG_BAN(PHONG_BAN_ID, NHAN_VIEN_ID, PHONG_BAN_TU_NGAY)
VALUES (1, 6, TO_DATE('01-10-2015', 'dd-mm-yyyy'));

INSERT INTO NHAN_VIEN_PHONG_BAN(PHONG_BAN_ID, NHAN_VIEN_ID, PHONG_BAN_TU_NGAY)
VALUES (1, 7, TO_DATE('01-10-2015', 'dd-mm-yyyy'));

INSERT INTO NHAN_VIEN_PHONG_BAN(PHONG_BAN_ID, NHAN_VIEN_ID, PHONG_BAN_TU_NGAY)
VALUES (2, 8, TO_DATE('01-10-2015', 'dd-mm-yyyy'));

-- Test
SELECT *
FROM PHONG_BAN;

SELECT *
FROM CHUC_VU;

SELECT *
FROM NHAN_VIEN;

SELECT *
FROM LUONG;

SELECT *
FROM NHAN_VIEN_CHUC_VU;

SELECT *
FROM NHAN_VIEN_PHONG_BAN;