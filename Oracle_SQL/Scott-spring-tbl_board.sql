--seq_board 시퀀스 생성
create sequence seq_board;

--실습용 tbl_board 테이블 생성
create table tbl_board (
bno number(10,0),
title varchar2(200) not null,
content varchar2(2000) not null,
writer varchar2(50) not null,
regdate date default sysdate,
updatedate date default sysdate
);

--게시물 primary key키 지정
alter table tbl_board add constraint pk_board primary key (bno);

--dummy 데이터 삽입(테스트용 데이터)
insert into tbl_board (bno, title, content, writer)
values(seq_board.nextval, '테스트 제목', '테스트 내용', 'user00');

-- tbl_board 테이블 전체 조회
select * from tbl_board;

--create는 상관없지만 insert는 commit를 안하면 데이터가 날아갈 수 있음
commit;

--추후 삭제 필요시 사용
--테이블 날리기
drop table tbl_board;
--시퀀스 날리기
drop sequence seq_board;