--seq_h_board 시퀀스 생성(일련 번호를 위한 시퀀스 생성)
create sequence seq_h_board;

--h_board 테이블 생성
create table h_board(
bno number(10,0),
title varchar2(200) not null,
content varchar2(4000) not null,
writer varchar2(100) not null,
phone varchar2(100) not null,
regdate date default sysdate,
updatedate date default sysdate
);

--h_board 테이블 pk 제약조건 수정 및 추가
alter table h_board add constraint pk_h_board primary key(bno);

select * from h_board;

--테스트용 dummy 데이터 삽입
insert into h_board values(seq_h_board.nextval,'제목','내용','작성자','010-1234-5678',sysdate,sysdate);

commit;