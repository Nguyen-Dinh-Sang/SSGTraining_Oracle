-- Data test
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

commit;

