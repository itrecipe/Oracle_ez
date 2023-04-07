--member(실습) 테이블 생성
create table member(
name varchar2(30),
userid varchar2(30),
pwd varchar2(30),
email varchar2(30),
phone char(20),
admin number(1) default 0, --0:user 1:admin
primary key(userid)
);

--테이블 삭제
drop table member;

--테이블 전체 조회
select * from member;

--데이터 입력(값을 집어넣기)
insert into member
values('이소라','sora','1234','gmd@naver.com','010-2222-3333',0);

insert into member
values('이소미','somi','1234','gmd@naver.com','010-2222-3333',0);

insert into member
values('이소희','sohee','1234','gmd@naver.com','010-2222-3333',0);

commit;