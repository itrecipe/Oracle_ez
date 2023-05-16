--첨부파일 테이블 생성
create table tbl_attach(
uuid varchar2(100) not null,
uploadPath varchar2(200) not null,
fileName varchar2(100) not null,
filetype char(1) default '1',
bno number(10,0)
);

select * from tbl_attach;

--제약조건으로 pk_attach uuid에 pk잡기
alter table tbl_attach add constraint pk_attach primary key (uuid);

--외래키 잡기
alter table tbl_attach add constraint fk_board_attach foreign key (bno) references tbl_board(bno);

commit;