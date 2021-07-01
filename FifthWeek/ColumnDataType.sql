-- Tạo bảng.
create table this_table_has_three_columns (
  this_is_a_character_column varchar2(100),
  this_is_a_number_column    number,
  this_is_a_date_column      date
);

-- Xem thông tin các cột.
select table_name, column_name, data_type, data_length, data_precision, data_scale
from   user_tab_columns
where table_name = 'NHAN_VIEN';

-- Kiểu character.
create table character_data (
  varchar_10_col   varchar2(10),
  varchar_4000_col varchar2(4000),
  char_10_col      char(10),
  clob_col         clob
);

-- Xem thông tin.
select column_name, data_type, data_length
from   user_tab_columns
where  table_name = 'CHARACTER_DATA';

-- Kiểu numeric
create table numeric_data (
  number_3_sf_2_dp  number(3, 2),
  number_3_sf_2     number(3, -2),
  number_5_sf_0_dp  number(5, 0),
  integer_col       integer,
  float_col         float(10),
  real_col          real,
  binary_float_col  binary_float,
  binary_double_col binary_double
);

-- Xem thông tin bảng.
select column_name, data_type, data_length, data_precision, data_scale
from   user_tab_columns
where  table_name = 'NUMERIC_DATA';

-- Kiểu date time.
create table datetime_data (
  date_col                      date,
  timestamp_with_3_frac_sec_col timestamp(3),
  timestamp_with_tz             timestamp with time zone,
  timestamp_with_local_tz       timestamp with local time zone,
  year_to_month_col             interval year to month,
  day_to_second_col             interval day to second
);

select column_name, data_type, data_length, data_precision, data_scale
from   user_tab_columns
where  table_name = 'DATETIME_DATA';