-- Data test.
create table SANGND_TOYS (
  toy_name varchar2(100),
  colour   varchar2(10),
  price    number(10, 2)
);

insert into SANGND_TOYS values ( 'Sir Stripypants', 'red', 0.01 );
insert into SANGND_TOYS values ( 'Miss Smelly_bottom', 'blue', 6.00 );
insert into SANGND_TOYS values ( 'Cuteasaurus', 'blue', 17.22 );
insert into SANGND_TOYS values ( 'Mr Bunnykins', 'red', 14.22 );
insert into SANGND_TOYS values ( 'Baby Turtle', 'green', null );

commit;

-- * Chỉ lấy được các cột visible.
select *
from SANGND_TOYS;

-- Muốn lấy các cột invisible cần phải liệt kê trong Select.
select TOY_NAME, PRICE
from SANGND_TOYS;

select PRICE, COLOUR
from SANGND_TOYS;

-- Where.
select *
from SANGND_TOYS
where TOY_NAME = 'Sir Stripypants';

select *
from SANGND_TOYS
where COLOUR = 'red';

-- And.
select  *
from    SANGND_TOYS
where   TOY_NAME = 'Sir Stripypants'
        AND COLOUR = 'red';
        
-- Or.
select  *
from    SANGND_TOYS
where   TOY_NAME = 'Sir Stripypants'
        or COLOUR = 'green';
        
-- Độ ưu tiên giữa And và Or.
select  *
from    SANGND_TOYS
where   (TOY_NAME = 'Mr Bunnykins'
        or  TOY_NAME = 'Baby Turtle')
        and COLOUR = 'green';

select  *
from    SANGND_TOYS
where   COLOUR = 'green'
        and (TOY_NAME = 'Mr Bunnykins'
        or  TOY_NAME = 'Baby Turtle');

select  *
from    SANGND_TOYS
where   (TOY_NAME = 'Sir Stripypants'
        or COLOUR = 'blue')
        and PRICE = 6;

-- Or and In.
select  *
from    SANGND_TOYS
where   COLOUR = 'blue'
        or COLOUR = 'green';
        
select  *
from    SANGND_TOYS
where   COLOUR in ('blue', 'green');
        
-- >, <, =
select  *
from    SANGND_TOYS
where   PRICE < 10;

-- Between - and
select  *
from    SANGND_TOYS
where   PRICE   between 6
                and     20;
                
select  *
from    SANGND_TOYS
where   (COLOUR in ('red', 'blue')
        and (PRICE   >= 6 and PRICE < 14.22));
