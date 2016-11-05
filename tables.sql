drop table completed_complaints;
drop table complaints;
drop table customers;


create table customers
( custname varchar(10) primary key,
  pwd   varchar(10) not null,
  email varchar(30) unique,
  phoneno varchar(30) 
);



create table complaints
( compid    number(5) primary key,
  custname  varchar(10) references customers,
  devtype  varchar(5),
  serialno  varchar(20) not null,
  complaint varchar(200) not null,
  dc        date 
);


create table completed_complaints
(
  compid    number(5) primary key,
  custname  varchar(10),
  devtype   varchar(5),
  serialno  varchar(20),
  complaint varchar(200),
  dc        date,
  solution  varchar(200),
  ds        date
);



insert into customers values('first','first','first@yahoo.com','23233232');
insert into customers values('second','second','second@yahoo.com','43233232');


insert into complaints values(10,'first','hdd','hdd-3434333',
'System is not recognizing hard disk','11-feb-2004');


insert into complaints values(11,'second','mon','mon-122323',
'Printer Driver is not found for Windows 98','13-feb-2004');


insert into completed_complaints  values( 1,'first','prn','prn-232322','Printing is very light',
'20-jan-2004',
'Changed darkness settings in Printer Settings',
'22-jan-2004');


insert into completed_complaints  values( 3,'first','prn','prn-232322','Characters are not printed properly',
'26-jan-2004',
'Changed Tonner',
'27-jan-2004');



insert into completed_complaints  values(4,'first','hdd','hdd-223223','System recognizes HD incorrectly',
'30-jan-2004',
'Go to BIOS settings and set mode to AUTO',
'30-jan-2004');


commit;



   