--tbl_reply ��� ���̺� ����
create table tbl_reply (
rno number(10,0) not null, --pk
bno number(10,0) not null, --FK
reply varchar2(1000) not null,
replyer varchar2(50) not null,
replyDate date default sysdate,
updatedate date default sysdate
);

--req_reply ������ ����
create sequence seq_reply nocache;

drop sequence seq_reply;
drop table tbl_reply;
truncate table tbl_reply;

--tbl_reply ���̺� ���� �� pk�� ���������� �ɱ�
alter table tbl_reply add constraint pk_reply primary key (rno);

alter table tbl_reply add constraint fk_reply_board  foreign  key (bno) references tbl_board (bno);

select * from tbl_reply;

select * from tbl_board;

--insert test
insert into tbl_reply(rno, bno, reply, replyer)
 		values(seq_reply.nextval, 1, '���', '�ۼ���');

commit;