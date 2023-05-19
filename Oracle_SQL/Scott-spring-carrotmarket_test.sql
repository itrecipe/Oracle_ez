create table car(
id number(10,0),
carno number(10,0) primary key,
cartype varchar2(50),
carkilos varchar2(50),
cardisp varchar2(50),
carfuel varchar2(50),
caryear varchar2(50),
carprice varchar2(50),
cardate varchar2(50)
);

select * from car;

drop table car;

alter table car add constraint fk_member foreign key (cno) references (cno);