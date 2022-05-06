connect to s4;

alter table offer add foreign key (vendor) references vendor(nr);

commit work;

connect reset;

terminate;

