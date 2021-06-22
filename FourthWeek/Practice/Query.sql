-- Câu 3
SELECT  "Employee", CONNECT_BY_ROOT ma_nhan_vien "Manager"
   FROM nhan_vien
WHERE LEVEL = 2
   CONNECT BY PRIOR nhan_vien_id = quan_ly_id;



SELECT MA_NHAN_VIEN, 
    QUAN_LY_ID,
    CONNECT_BY_ROOT  ma_nhan_vien
FROM NHAN_VIEN
Start  With nhan_vien_id = 2
CONNECT BY PRIOR nhan_vien_id  = quan_ly_id

order by nhan_vien_id;   