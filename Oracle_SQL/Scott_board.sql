--board ���̺� ����
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

--board ������ ����(�Ϸ��� ��ȣ�� ����)
create sequence board_seq nocache;

--dummy ������ ����
insert into board(num,pass,name,email,title,content)
values(board_seq.nextval,'1234','����','hsk@naver.com','title1','content1');

insert into board(num,pass,name,email,title,content)
values(board_seq.nextval,'1233','���','ksk@naver.com','title2','content2');

insert into board(num,pass,name,email,title,content)
values(board_seq.nextval,'1232','�ڽ�','psk@naver.com','title1','content1');

drop table board;
drop sequence board_seq;

select * from board;

commit;