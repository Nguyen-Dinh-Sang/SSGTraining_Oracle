--- Phòng ban.
CREATE TABLE PHONG_BAN (
    PHONG_BAN_ID INTEGER PRIMARY KEY,
    MA_PHONG_BAN NVARCHAR2(10) NOT NULL,
    TEN_PHONG_BAN NVARCHAR2(20) NOT NULL
);

-- Create sequence.
CREATE SEQUENCE PHONG_BAN_SEQUENCE;

-- create tigger using the sequence.
CREATE OR REPLACE TRIGGER PHONG_BAN_TRIGGER
BEFORE INSERT ON PHONG_BAN
FOR EACH ROW
WHEN (NEW.PHONG_BAN_ID IS NULL)
BEGIN
  SELECT PHONG_BAN_SEQUENCE.NEXTVAL
  INTO   :NEW.PHONG_BAN_ID
  FROM   DUAL;
END;

-- Chức vụ.
CREATE TABLE CHUC_VU (
    CHUC_VU_ID INTEGER PRIMARY KEY,
    MA_CHUC_VU NVARCHAR2(10) NOT NULL,
    TEN_CHUC_VU NVARCHAR2(20) NOT NULL
);

-- Create sequence.
CREATE SEQUENCE CHUC_VU_SEQUENCE;

-- create tigger using the sequence.
CREATE OR REPLACE TRIGGER CHUC_VU_TRIGGER
BEFORE INSERT ON CHUC_VU
FOR EACH ROW
WHEN (NEW.CHUC_VU_ID IS NULL)
BEGIN
  SELECT CHUC_VU_SEQUENCE.NEXTVAL
  INTO   :NEW.CHUC_VU_ID
  FROM   DUAL;
END;

-- Nhân viên.
CREATE TABLE NHAN_VIEN (
    NHAN_VIEN_ID INTEGER PRIMARY KEY,
    MA_NHAN_VIEN NVARCHAR2(10) NOT NULL,
    HO NVARCHAR2(20),
    DEM NVARCHAR2(20),
    TEN NVARCHAR2(20) NOT NULL,
    NGAY_SINH DATE NOT NULL,
    QUAN_LY_ID INTEGER,
    FOREIGN KEY (QUAN_LY_ID) REFERENCES NHAN_VIEN(NHAN_VIEN_ID)
);

-- Create sequence.
CREATE SEQUENCE NHAN_VIEN_SEQUENCE;

-- create tigger using the sequence.
CREATE OR REPLACE TRIGGER NHAN_VIEN_TRIGGER
BEFORE INSERT ON NHAN_VIEN
FOR EACH ROW
WHEN (NEW.NHAN_VIEN_ID IS NULL)
BEGIN
  SELECT NHAN_VIEN_SEQUENCE.NEXTVAL
  INTO   :NEW.NHAN_VIEN_ID
  FROM   DUAL;
END;

-- Lương.
CREATE TABLE LUONG (
    LUONG_ID INTEGER PRIMARY KEY,
    NHAN_VIEN_ID INTEGER NOT NULL,
    LUONG_TU_NGAY DATE NOT NULL,
    LUONG_DEN_NGAY DATE,
    LUONG NUMBER(10,2) NOT NULL,
    FOREIGN KEY (NHAN_VIEN_ID) REFERENCES NHAN_VIEN(NHAN_VIEN_ID)
)

-- Create sequence.
CREATE SEQUENCE LUONG_SEQUENCE;

-- Create tigger using the sequence.
CREATE OR REPLACE TRIGGER LUONG_TRIGGER
BEFORE INSERT ON LUONG 
FOR EACH ROW
WHEN (NEW.LUONG_ID IS NULL)
BEGIN
  SELECT LUONG_SEQUENCE.NEXTVAL
  INTO   :NEW.LUONG_ID
  FROM   DUAL;
END;

-- Nhân viên - Chức vụ.
CREATE TABLE NHAN_VIEN_CHUC_VU (
    NHAN_VIEN_CHUC_VU_ID INTEGER PRIMARY KEY,
    CHUC_VU_ID INTEGER NOT NULL,
    NHAN_VIEN_ID INTEGER NOT NULL,
    CHUC_VU_TU_NGAY DATE NOT NULL,
    CHUC_VU_DEN_NGAY DATE,
    FOREIGN KEY (CHUC_VU_ID) REFERENCES CHUC_VU(CHUC_VU_ID),
    FOREIGN KEY (NHAN_VIEN_ID) REFERENCES NHAN_VIEN(NHAN_VIEN_ID)
);

-- Create sequence.
CREATE SEQUENCE NHAN_VIEN_CHUC_VU_SEQUENCE;

-- Create tigger using the sequence.
CREATE OR REPLACE TRIGGER NHAN_VIEN_CHUC_VU_TRIGGER
BEFORE INSERT ON NHAN_VIEN_CHUC_VU
FOR EACH ROW
WHEN (NEW.NHAN_VIEN_CHUC_VU_ID IS NULL)
BEGIN
  SELECT NHAN_VIEN_CHUC_VU_SEQUENCE.NEXTVAL
  INTO   :NEW.NHAN_VIEN_CHUC_VU_ID
  FROM   DUAL;
END;

-- Nhân viên - Phòng ban.
CREATE TABLE NHAN_VIEN_PHONG_BAN (
    NHAN_VIEN_PHONG_BAN_ID INTEGER PRIMARY KEY,
    PHONG_BAN_ID INTEGER NOT NULL,
    NHAN_VIEN_ID INTEGER NOT NULL,
    PHONG_BAN_TU_NGAY DATE NOT NULL,
    PHONG_BAN_DEN_NGAY DATE,
    FOREIGN KEY (PHONG_BAN_ID) REFERENCES PHONG_BAN(PHONG_BAN_ID),
    FOREIGN KEY (NHAN_VIEN_ID) REFERENCES NHAN_VIEN(NHAN_VIEN_ID)
);

-- Create sequence.
CREATE SEQUENCE NHAN_VIEN_PHONG_BAN_SEQUENCE;

-- Create tigger using the sequence.
CREATE OR REPLACE TRIGGER NHAN_VIEN_PHONG_BAN_TRIGGER
BEFORE INSERT ON NHAN_VIEN_PHONG_BAN
FOR EACH ROW
WHEN (NEW.NHAN_VIEN_PHONG_BAN_ID IS NULL)
BEGIN
  SELECT NHAN_VIEN_PHONG_BAN_SEQUENCE.NEXTVAL
  INTO   :NEW.NHAN_VIEN_PHONG_BAN_ID
  FROM   DUAL;
END;