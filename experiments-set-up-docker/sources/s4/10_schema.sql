create database s4;

connect to s4;

create table offer  (
                  nr integer not null primary key,
                  product integer ,
                  producer integer ,
                  vendor integer ,
                  price double with default null ,
                  validfrom date with default null ,
                  validto date with default null ,
                  deliverydays integer with default null ,
                  offerwebpage varchar(100 octets) with default null ,
                  publisher integer ,
                  publishdate date );


create table producer  (
                  nr integer not null primary key,
                  label varchar(100 octets) with default null ,
                  comment varchar(2000 octets) with default null ,
                  homepage varchar(100 octets) with default null ,
                  country char(2 octets) with default null ,
                  publisher integer ,
                  publishdate date );

create table vendor  (
                  nr integer not null primary key,
                  label varchar(100 octets) with default null ,
                  comment varchar(2000 octets) with default null ,
                  homepage varchar(100 octets) with default null ,
                  country char(2 octets) with default null ,
                  publisher integer ,
                  publishdate date );

commit work;

connect reset;

terminate;
