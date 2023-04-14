select dbms_xdb.gethttpport() from dual;
exec dbms_xdb.sethttpport(9090);
Select dbms_xdb.gethttpport() from dual;


