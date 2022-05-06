CREATE TABLE review (
  nr int(11) primary key,
  product int (11),
  producer int (11),
  person int (11),
  reviewdate date default NULL,
  title varchar(200) character set utf8 collate utf8_bin default NULL,
  text varchar(8192) character set utf8 collate utf8_bin,
  language char(2) character set utf8 collate utf8_bin default NULL,
  rating1 int(11) default NULL,
  rating2 int(11) default NULL,
  rating3 int(11) default NULL,
  rating4 int(11) default NULL,
  publisher int(11),
  publishdate date,
  INDEX USING BTREE (product),
  INDEX USING BTREE (person)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE person (
  nr int(11) primary key,
  name varchar(30) character set utf8 collate utf8_bin default NULL,
  mbox_sha1sum char(40) character set utf8 collate utf8_bin default NULL,
  country char(2) character set utf8 collate utf8_bin default NULL,
  publisher int(11),
  publishdate date
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
