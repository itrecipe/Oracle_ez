--carrot_member ���̺� ����
create table carrot_member(
id number(10) constraint carr_mem_id_pk primary key,
userid varchar2(20) not null,
userpwd varchar2(60) not null,
username varchar2(10) not null,
nickname varchar2(20) not null,
address varchar2(40) not null
);

--carr_mem_id_seq ������ ����
create sequence carr_mem_id_seq;

--dummy ������ ����
insert into carrot_member(id, userid, userpwd, username, nickname, address) 
values(carr_mem_id_seq.NEXTVAL,'admin','admin','���','����','����');

insert into carrot_member(id, userid, userpwd, username, nickname, address) 
values(carr_mem_id_seq.nextval,'user','user','ȸ��','��ȸ��','�λ�');

--findMember
select * from carrot_member where username = username;

select * from carrot_member;

truncate table carrot_member;

commit;