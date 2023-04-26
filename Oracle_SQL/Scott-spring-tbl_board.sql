--seq_board ������ ����
create sequence seq_board;

--�ǽ��� tbl_board ���̺� ����
create table tbl_board (
bno number(10,0),
title varchar2(200) not null,
content varchar2(2000) not null,
writer varchar2(50) not null,
regdate date default sysdate,
updatedate date default sysdate
);

--�Խù� primary keyŰ ����
alter table tbl_board add constraint pk_board primary key (bno);

--dummy ������ ����(�׽�Ʈ�� ������)
insert into tbl_board (bno, title, content, writer)
values(seq_board.nextval, '�׽�Ʈ ����', '�׽�Ʈ ����', 'user00');

-- tbl_board ���̺� ��ü ��ȸ
select * from tbl_board;

--create�� ��������� insert�� commit�� ���ϸ� �����Ͱ� ���ư� �� ����
commit;

--���� ���� �ʿ�� ���

--���̺� ����
drop table tbl_board;

--������ ����
drop sequence seq_board;

--ORACLE_DB ������ ó�� �׽�Ʈ �ڵ�
select * from tbl_board order by bno desc;
select * from tbl_board order by bno + 1 desc;

--select�� �ڿ� hint�� �ٿ��� ������ �˻��ϱ�
select /*+ INDEX_ASC(tbl_board pk_board) */
rownum rn, bno, title, content
from tbl_board order by bno;