create SEQUENCE seq_board;

create table tbl_board(
    bno number(10,0),
    title varchar2(200) not null,
    content varchar2(2000) not null,
    writer varchar2(50) not null,
    regdate date default sysdate,
    updatedate date default sysdate
);

alter table tbl_board add CONSTRAINT pk_board
primary key (bno);


insert into tbl_board(bno, title, content, writer)
values (SEQ_BOARD.nextval, '�׽�Ʈ ����', '�׽�Ʈ ����', 'user00');


select * from tbl_board where bno =5;


