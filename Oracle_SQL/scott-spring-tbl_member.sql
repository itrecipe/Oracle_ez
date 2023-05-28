--security�� ȸ�� ���̺� ����
create table tbl_member(
userid varchar2(50) not null primary key,
userpw varchar2(100) not null,
username varchar2(100) not null,
regdate date default sysdate,
updateDate date default sysdate,
enabled char(1) default '1'
);

drop table tbl_member;
drop table tbl_member_auth;

--����(����) ���̺� 1:N ����
create table tbl_member_auth(
userid varchar2(50) not null,
auth varchar2(50) not null,
constraint fk_member_auth foreign key(userid) references tbl_member(userid)
);

--remember-me ���� ���̺�(�������� ������ �԰�)
create table persistent_logins(
username varchar2(64) not null,
series varchar2(64) primary key,
token varchar2(64) not null,
last_used timestamp not null
);

select * from tbl_member;

select * from persistent_logins;