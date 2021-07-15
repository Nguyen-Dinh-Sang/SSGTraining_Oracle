-- Data test.
create table SANGND_TOYS (
    TOY_ID      integer,
    TOY_NAME    varchar2(20),
    TOY_COLOUR  varchar2(10)
);

create table SANGND_BRICKS (
    BRICK_ID        integer,
    BRICK_COLOUR    varchar2(10),
    BRICK_SHAPE     varchar2(10)
)

insert into SANGND_TOYS values ( 1, 'Miss Snuggles', 'pink' ) ;
insert into SANGND_TOYS values ( 2, 'Cuteasaurus', 'blue' ) ;
insert into SANGND_TOYS values ( 3, 'Baby Turtle', 'green' ) ;

insert into SANGND_BRICKS values ( 2, 'blue', 'cube' );
insert into SANGND_BRICKS values ( 3, 'green', 'cube' );
insert into SANGND_BRICKS values ( 4, 'blue', 'pyramid' );
insert into SANGND_BRICKS values ( 3, 'red', 'pyrmaid' );

commit;

-- Cross join.
-- Kiểu join mặc đinh.
select  * 
from    SANGND_TOYS, SANGND_BRICKS;

select  * 
from    SANGND_TOYS
cross   join SANGND_BRICKS;

-- Inner join.
select  * 
from    SANGND_TOYS, SANGND_BRICKS
where   TOY_ID = BRICK_ID;


select  * 
from    SANGND_TOYS
inner   join SANGND_BRICKS
on      TOY_ID = BRICK_ID;

-- Có thể bỏ từ khóa inner.
select  * 
from    SANGND_TOYS
join    SANGND_BRICKS
on      TOY_ID = BRICK_ID;

select  * 
from    SANGND_TOYS
join    SANGND_BRICKS
on      TOY_COLOUR != BRICK_COLOUR;

-- Join điều kiện toy_id lớn hơn brick_id.
select * 
from    SANGND_TOYS
join    SANGND_BRICKS
on      TOY_ID > BRICK_ID;

-- Outer join.
select  * 
from    SANGND_TOYS
outer   join   SANGND_BRICKS
on      TOY_ID = BRICK_ID;

select  * 
from    SANGND_TOYS
left    outer join  SANGND_BRICKS
on      TOY_ID = BRICK_ID;

-- Tương tự với Oracle syntax.
select  * 
from    SANGND_TOYS, SANGND_BRICKS
where   TOY_ID = BRICK_ID (+);

-- Lọc.
select  * 
from    SANGND_TOYS
join    SANGND_BRICKS
on      TOY_ID = BRICK_ID
where   BRICK_COLOUR = 'green';


select  * 
from    SANGND_TOYS
left    join SANGND_BRICKS
on      TOY_ID = BRICK_ID
where   BRICK_COLOUR = 'green';

-- Tương tự.
select  * 
from    SANGND_TOYS, SANGND_BRICKS
where   TOY_ID (+) = BRICK_ID
and     BRICK_COLOUR = 'green';

-- Lọc dữ liệu của bảng trước khi join.
select  * 
from    SANGND_TOYS
left    join SANGND_BRICKS
on      TOY_ID = BRICK_ID
and     BRICK_COLOUR = 'green';

select  * 
from    SANGND_TOYS, SANGND_BRICKS
where   TOY_ID = BRICK_ID (+)
and     BRICK_COLOUR (+) = 'green';

select  *
from    SANGND_BRICKS
left    join    SANGND_TOYS
on      BRICK_ID = TOY_ID
and     TOY_COLOUR = 'blue';

-- Full outer join.
select  * 
from    SANGND_TOYS
full    join SANGND_BRICKS
on      TOY_ID = BRICK_ID;

-- Tương tự sử dụng 2 outer join.
select  * 
from    SANGND_TOYS, SANGND_BRICKS
where   TOY_ID = BRICK_ID (+)
union   all
select  * 
from    SANGND_TOYS, SANGND_BRICKS
where   TOY_ID (+) = BRICK_ID
and     TOY_ID is null;