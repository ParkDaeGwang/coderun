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
select SEQ_BOARD.nextval, '테스트 제목', '테스트 내용', 'user00'
FROM TBL_BOARD;

SELECT RN, BNO, TITLE, CONTENT
FROM 
    (SELECT /*+ INDEX_DESC(TBL_BOARD PK_BOARD)*/
        ROWNUM RN, BNO, TITLE, CONTENT 
    FROM TBL_BOARD
    WHERE ROWNUM <= 100)
WHERE RN > 50;

SELECT * FROM tbl_board ORDER BY BNO;
commit;