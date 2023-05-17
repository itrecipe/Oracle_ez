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
where carrot_member.id = '5';

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

commit;