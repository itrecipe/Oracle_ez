--÷������ ���̺� ����
create table tbl_attach(
uuid varchar2(100) not null,
uploadPath varchar2(200) not null,
fileName varchar2(100) not null,
filetype char(1) default '1',
bno number(10,0)
);

select * from tbl_attach;

--������������ pk_attach uuid�� pk���
alter table tbl_attach add constraint pk_attach primary key (uuid);

--�ܷ�Ű ���
alter table tbl_attach add constraint fk_board_attach foreign key (bno) references tbl_board(bno);

commit;