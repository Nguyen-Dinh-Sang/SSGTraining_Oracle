-- Xem thông tin của bảng.
select table_name, iot_name, iot_type, external, 
       partitioned, temporary, cluster_name
from   all_tables ;

-- Bảng mới tạo mặc định Organization heap
create table toys_heap (
  toy_name varchar2(100)
);
--=> để tường minh có thể ghi
create table toys_heap (
  toy_name varchar2(100)
) organization heap;

-- Index Organized Tables(IOT)
create table toys_iot (
  toy_id   integer primary key,
  toy_name varchar2(100)
) organization index;

select table_name, iot_type
from   user_tables
where  table_name = 'TOYS_IOT';