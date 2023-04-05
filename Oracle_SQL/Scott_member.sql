--member(실습) 테이블 생성
create table member(
name varchar2(10),
userid varchar2(10),
pwd varchar2(10),
email varchar2(20),
phone char(13),
admin number(1) default 0, --0:user 1:admin
primary key(userid)
);

drop table member;

select * from member;

insert into member
values('이소라','sora','1234','gmd@naver.com','010-2222-3333',0);

insert into member
values('이소미','somi','1234','gmd@naver.com','010-2222-3333',0);

insert into member
values('이소희','sohee','1234','gmd@naver.com','010-2222-3333',0);

commit;