-- Dữ liệu test.
create table SANGND_BRICKS (
  COLOUR varchar2(10),
  SHAPE  varchar2(10),
  WEIGHT integer
);

insert into SANGND_BRICKS values ( 'red', 'cube', 1 );
insert into SANGND_BRICKS values ( 'red', 'pyramid', 2 );
insert into SANGND_BRICKS values ( 'red', 'cuboid', 1 );

insert into SANGND_BRICKS values ( 'blue', 'cube', 1 );
insert into SANGND_BRICKS values ( 'blue', 'pyramid', 2 );

insert into SANGND_BRICKS values ( 'green', 'cube', 3 );

commit;

select *
from SANGND_BRICKS;

-- Aggregate Functions.
-- Đếm số dòng trong bảng.
select  count(*)
from    SANGND_BRICKS;

-- Chỉ lấy những hàng có giá trị khác null.
select  count(COLOUR)
from    SANGND_BRICKS;

select  sum (WEIGHT), min (WEIGHT), max (WEIGHT), 
        avg (WEIGHT), stddev (WEIGHT),
        median (WEIGHT), variance (WEIGHT),
        stats_mode (WEIGHT) 
from    SANGND_BRICKS;

-- Distinct.
select  count (distinct COLOUR) number_of_different_colours
from    SANGND_BRICKS;

select  count (all COLOUR) total_number_of_rows, 
        count (distinct COLOUR) number_of_different_colours, 
        count (unique COLOUR) number_of_unique_colours
from    SANGND_BRICKS;

-- Có thể sử dụng Distinct cho hầu hết các hàm.
select  sum ( WEIGHT ) total_weight, sum ( distinct WEIGHT ) sum_of_unique_weights, 
        avg ( WEIGHT ) overall_mean, avg ( distinct WEIGHT ) mean_of_unique_weights
from    SANGND_BRICKS;

-- Stddev: hàm tính độ lệch chuẩn.
select count ( distinct SHAPE ) number_of_shapes,
       stddev ( distinct WEIGHT ) distinct_weight_stddev
from   SANGND_BRICKS;

-- Group by.
select  COLOUR, count (*) 
from    SANGND_BRICKS
group   by COLOUR;

-- Không cần select colour vẫn được, nhưng thường hay gây nhầm lẫn nên cần select thêm cột group by vào.
select  count (*) 
from    SANGND_BRICKS
group   by COLOUR;

select  SHAPE, WEIGHT, count (*) 
from    SANGND_BRICKS
group   by SHAPE, WEIGHT;

select  SHAPE, sum(WEIGHT)
from    SANGND_BRICKS
group   by SHAPE;

-- Lọc.
select  COLOUR, count (*) 
from    SANGND_BRICKS
where   WEIGHT > 1
group   by COLOUR;
-- Chỉ được lọc trên cột, các giá trị không phải là tổng hợp từ các hàm.

-- Muốn lọc trên các hàm tổng hợp phải dùng having, và nó chạy sau group by.
select  COLOUR, count (*)
from    SANGND_BRICKS
group   by COLOUR
having  count (*) > 1;

select  COLOUR, count (*) 
from    SANGND_BRICKS
having  count (*) > 1
group   by COLOUR;

-- Có thể nhiều sử dụng các chức năng khác nhau.
-- Tìm các màu có tổng weight > 1 và in ra số dòng mỗi màu.
select  COLOUR, count (*) 
from    SANGND_BRICKS
having  sum ( WEIGHT ) > 1
group   by COLOUR;

-- Tìm số shapes có tổng weight nhỏ hơn 4.
select  SHAPE, sum ( WEIGHT )
from    SANGND_BRICKS
group   by SHAPE
having  sum (WEIGHT) < 4;

-- Rollup
select  COLOUR, SHAPE, count (*)
from    SANGND_BRICKS
group   by rollup ( COLOUR, SHAPE );

select *
from SANGND_BRICKS

-- Kết hợp roll up với không rollup, 
-- trong trường hợp này tổng số dành cho cột bên ngoài rollup tổng hợp (bỏ trường hợp null null).
select  COLOUR, SHAPE, count (*)
from    SANGND_BRICKS
group   by COLOUR, rollup ( SHAPE );

-- Cube
select  COLOUR, SHAPE, count (*)
from    SANGND_BRICKS
group   by cube ( COLOUR, SHAPE );