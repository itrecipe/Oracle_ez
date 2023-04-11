--board Å×ÀÌºí »ı¼º
create table board(
num number(5) primary key,
pass varchar2(30),
name varchar2(30),
email varchar2(30),
title varchar2(50),
content varchar2(500),
readcount number(4) default 0,
writerdate date default sysdate
);

--board ½ÃÄö½º »ı¼º(ÀÏ·ÃÀÇ ¹øÈ£¸¦ »ı¼º)
create sequence board_seq nocache;

--dummy µ¥ÀÌÅÍ »ğÀÔ
insert into board(num,pass,name,email,title,content)
values(board_seq.nextval,'1234','±¹½Ü','hsk@naver.com','title1','content1');

insert into board(num,pass,name,email,title,content)
values(board_seq.nextval,'1233','±è½Ü','ksk@naver.com','title2','content2');

insert into board(num,pass,name,email,title,content)
values(board_seq.nextval,'1232','¹Ú½Ü','psk@naver.com','title1','content1');

drop table board;
drop sequence board_seq;

select * from board;

commit;