-- Xem thông tin của bảng.
select table_name, iot_name, iot_type, external, 
       partitioned, temporary, cluster_name
from   all_tables ;

-- Bảng mới tạo mặc định Organization heap.
create table toys_heap (
  toy_name varchar2(100)
);
--=> để tường minh có thể ghi.
create table toys_heap (
  toy_name varchar2(100)
) organization heap;

-- Index Organized Tables(IOT).
-- các hàng trong bảng phải có thứ tự.
create table toys_iot (
  toy_id   integer primary key,
  toy_name varchar2(100)
) organization index;

select table_name, iot_type
from   user_tables
where  table_name = 'TOYS_IOT';

-- External Org.
create or replace directory toy_dir as '/path/to/file';

create table toys_ext (
  toy_name varchar2(100)
) organization external (
  default directory tmp
  location ('toys.csv')
);

-- Temporary Table.
create global temporary table toys_gtt (
  toy_name varchar2(100)
);

-- bảng private phải từ 18c mới xài được
create private temporary table ora$ptt_toys (
  toy_name varchar2(100)
);

-- Xem thông tin
select table_name, temporary
from   user_tables
where  table_name in ( 'TOYS_GTT', 'ORA$PTT_TOYS' );

-- Partition table.
create table toys_range (
  toy_name varchar2(100)
) partition by range ( toy_name ) (
  partition p0 values less than ('b'),
  partition p1 values less than ('c')
);

create table toys_list (
  toy_name varchar2(100)
) partition by list ( toy_name ) (
  partition p0 values ('Sir Stripypants'),
  partition p1 values ('Miss Snuggles')
);

create table toys_hash (
  toy_name varchar2(100)
) partition by hash ( toy_name ) partitions 4;

-- Partition thêm Org.
create table toys_part_iot (
  toy_id   integer primary key,
  toy_name varchar2(100)
) organization index 
  partition by hash ( toy_id ) partitions 4;

-- Xem thông tin.
select table_name, partitioned 
from   user_tables
where  table_name in ( 'TOYS_HASH', 'TOYS_LIST', 'TOYS_RANGE', 'TOYS_PART_IOT' );

select table_name, partition_name
from   user_tab_partitions;

-- Cụm table (Cluster).
-- Tạo Cluster.
create cluster toy_cluster (
  toy_name varchar2(100)
);

-- Thêm các bảng vào cum.
-- Các dàng có cùng toy_name trên hai bảng sẽ được lưu cùng chổ.
create table toys_cluster_tab (
  toy_name varchar2(100)
) cluster toy_cluster ( toy_name );

create table toy_owners_cluster_tab (
  owner    varchar2(20),
  toy_name varchar2(100)
) cluster toy_cluster ( toy_name );

-- Xem thông tin.
select cluster_name from user_clusters;

select table_name, cluster_name
from   user_tables
where  table_name in ( 'TOYS_CLUSTER_TAB', 'TOY_OWNERS_CLUSTER_TAB' );