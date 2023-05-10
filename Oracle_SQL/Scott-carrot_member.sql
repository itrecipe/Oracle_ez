--carrot_member 테이블 생성
create table carrot_member(
id number(10) constraint carr_mem_id_pk primary key,
userid varchar2(20) not null,
userpwd varchar2(60) not null,
username varchar2(10) not null,
nickname varchar2(20) not null,
address varchar2(40) not null
);

--carr_mem_id_seq 시퀀스 생성
create sequence carr_mem_id_seq;

--dummy 데이터 삽입
insert into carrot_member(id, userid, userpwd, username, nickname, address) 
values(carr_mem_id_seq.NEXTVAL,'admin','admin','운영자','영자','서울');

insert into carrot_member(id, userid, userpwd, username, nickname, address) 
values(carr_mem_id_seq.nextval,'user','user','회원','김회원','부산');

--findMember
select * from carrot_member where username = username;

select * from carrot_member;

truncate table carrot_member;

commit;