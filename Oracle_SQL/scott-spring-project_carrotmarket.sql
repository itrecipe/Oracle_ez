--테이블 및 제약조건 완전삭제
drop table carrot_member CASCADE CONSTRAINTS;

--시퀀스 삭제
drop sequence carr_mem_id_seq;

--carrot_member 테이블 생성
create table carrot_member(
id number(10) constraint carr_mem_id_pk primary key,
userid varchar2(20) not null,
userpwd varchar2(60) not null,
username varchar2(10) not null,
usernickname varchar2(20) not null,
useraddress varchar2(40) not null,
useremail varchar2(60),
usergender char(1)
);

--carr_mem_id_seq 시퀀스 생성
create sequence carr_mem_id_seq;

--dummy 데이터 삽입
insert into carrot_member values(1,'admin','1234','관리자','master','서울','admin@naver.com','1');

select * from carrot_member;

--테이블 데이터 삭제 쿼리
delete from carrot_member
where carrot_member.id = '21';

--게시글 테이블
drop table carrot_articles CASCADE CONSTRAINTS;

drop sequence carr_art_id_seq;

create table carrot_articles(
ID NUMBER(10,0) constraint carr_art_id_pk primary key,
MEMBERNO NUMBER(10,0) NOT NULL, 
TITLE VARCHAR2(50 BYTE) NOT NULL, 
BODY VARCHAR2(2000 BYTE) NOT NULL, 
COST NUMBER(10,0), 
COSTOFFER CHAR(1 BYTE) DEFAULT 0, 
REGDATE DATE DEFAULT sysdate, 
UPDATEDATE DATE DEFAULT sysdate,
LNG VARCHAR2(25 BYTE),
LAT VARCHAR2(25 BYTE),
LOCATIONINFO VARCHAR2(1000 BYTE), 
SEIL NUMBER(1,0) DEFAULT 0, 
HITCOUNT NUMBER(10,0) DEFAULT 0, 
THUMBNAILPATH VARCHAR2(100 BYTE),
CONSTRAINT CARR_ART_MEM_FK foreign key(MEMBERNO) references carrot_member (id)
);

create sequence carr_art_id_seq;

select * from carrot_articles;

--이미지 테이블
drop table carrot_img;

drop sequence carr_img_id_seq;

CREATE TABLE CARROT_IMG (	
ID NUMBER(10,0) CONSTRAINT CARR_IMG_ID_PK PRIMARY KEY, 
ARTICLENO NUMBER(10,0) NOT NULL, 
FILEPATH VARCHAR2(200 BYTE) NOT NULL, 
FILENAME VARCHAR2(100 BYTE) NOT NULL,
CONSTRAINT CARR_IMG_ART_FK FOREIGN KEY (ARTICLENO)REFERENCES CARROT_ARTICLES (ID)
);

create sequence carr_img_id_seq;

select c.*, m.nickname, m.address from carrot_articles c left outer join carrot_member m on(c.memberno = m.id);

select * from carrot_img;

--중고차 직거래 테이블 생성
create table carrot_car(
id number(10,0),  
cno number(10,0) constraint pk_carrot_car primary key,
writer varchar(50) not null,
title varchar2(200) not null,
content varchar2(4000) not null,
regDate date default sysdate,
updateDate date default sysdate,
carname varchar2(100) not null,
cartype varchar2(50) not null,
caryear varchar2(50) not null,
carprice varchar2(4000) not null,
cardate varchar2(100) not null,
fuel varchar2(50) not null,
disp varchar2(50) not null,
kilos varchar2(50) not null,
mission varchar2(50) not null
);

--시퀀스 생성
create sequence car_seq;

--carrot_member테이블의 ID를 참조 하기 위한 외래키 잡기
alter table carrot_car add constraint fk_carrot_car_id foreign key (id) references carrot_member(id);

select * from carrot_car;

drop table carrot_car;
drop sequence car_seq;

select * from carrot_car where cno > 0 order by cno desc;

delete carrot_car where cno = 1;

--select문 뒤에 hint를 붙여서 데이터 검색하기
select /*+ INDEX_ASC(carrot_car pk_carrot_car) */
rownum cno, title, content, writer, regdate, updatedate
from carrot_car order by cno;

--test - dummy data 삽입
insert into carrot_car(cno,writer,title,content,carname,cartype,caryear,carprice,cardate,fuel,disp,kilos,mission)
values(car_seq.nextval,'국쌤','코란도 팝니다.','23년식 코란도 팔아요','코란도','suv','2023.05.22','1000000','23.05.22','디젤','2000CC','200,000km','오토매틱');

--carrot_attach(첨부파일) 테이블 생성
create table carrot_attach(
uuid varchar2(200) not null,
uploadPath varchar2(200) not null,
fileName varchar2(200) not null,
filetype char(1) default '1',
cno number(10,0)
);

--pk_carrot_attach, 기본키 잡기
alter table carrot_attach add constraint pk_carrot_attach primary key(uuid);

--fk_car_attach, 외래키 잡기
alter table carrot_attach add constraint fk_carrot_attach foreign key(cno) references carrot_car(cno);

select * from carrot_attach;
select * from carrot_car order by  cno;
drop table carrot_attach;

desc carrot_attach;

select * from carrot_attach;

select count(cno) from carrot_car;

--이미지를 한개씩 가져올때 쓰려고 만든 쿼리
select * from carrot_attach where cno = 57 and rownum <= 1;

commit;