--spring Ʈ����� ó�� �׽�Ʈ ���̺� ����
create table tbl_sample1(col1 varchar2(500));
create table tbl_sample2(col2 varchar2(500));

select * from tbl_sample1;
select * from tbl_sample2;

drop table tbl_sample2;

--tbl_board ���̺� ��� - Ʈ����� ����
alter table tbl_board add (replycnt number default 0);

--tbl_board Ʈ����� ���� �� ������Ʈ ����
update tbl_board set replycnt = (select count(rno) from tbl_reply
where tbl_reply.bno = tbl_board.bno);

select * from tbl_board;

commit;