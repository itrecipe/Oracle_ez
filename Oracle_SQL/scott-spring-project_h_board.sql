--seq_h_board ������ ����(�Ϸ� ��ȣ�� ���� ������ ����)
create sequence seq_h_board;

--h_board ���̺� ����
create table h_board(
bno number(10,0),
title varchar2(200) not null,
content varchar2(4000) not null,
writer varchar2(100) not null,
phone varchar2(100) not null,
regdate date default sysdate,
updatedate date default sysdate
);

--h_board ���̺� pk �������� ���� �� �߰�
alter table h_board add constraint pk_h_board primary key(bno);

select * from h_board;

--�׽�Ʈ�� dummy ������ ����
insert into h_board values(seq_h_board.nextval,'����','����','�ۼ���','010-1234-5678',sysdate,sysdate);

commit;