--member(�ǽ�) ���̺� ����
create table member(
name varchar2(30),
userid varchar2(30),
pwd varchar2(30),
email varchar2(30),
phone char(20),
admin number(1) default 0, --0:user 1:admin
primary key(userid)
);

--���̺� ����
drop table member;

--���̺� ��ü ��ȸ
select * from member;

--������ �Է�(���� ����ֱ�)
insert into member
values('�̼Ҷ�','sora','1234','gmd@naver.com','010-2222-3333',0);

insert into member
values('�̼ҹ�','somi','1234','gmd@naver.com','010-2222-3333',0);

insert into member
values('�̼���','sohee','1234','gmd@naver.com','010-2222-3333',0);

commit;