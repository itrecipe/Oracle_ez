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

--테이블 삭제
drop table tbl_board;

--시퀀스 삭제
drop sequence seq_board;

--ORACLE_DB 페이지 처리 테스트 코드
select * from tbl_board order by bno desc;
select * from tbl_board order by bno + 1 desc;

--select문 뒤에 hint를 붙여서 데이터 검색하기
select /*+ INDEX_ASC(tbl_board pk_board) */
rownum rn, bno, title, content
from tbl_board order by bno;