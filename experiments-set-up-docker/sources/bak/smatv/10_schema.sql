
CREATE TABLE producer (
	nr INTEGER NOT NULL,
	label VARCHAR(100),
	comment VARCHAR(2000),
	homepage VARCHAR(100),
	country CHAR(2),
	publisher INTEGER,
	publishdate DATE,
	PRIMARY KEY (nr)
);

CREATE TABLE product (
	nr INTEGER NOT NULL,
	label VARCHAR(100),
	comment VARCHAR(2000),
	producer INTEGER,
	propertynum1 INTEGER,
	propertynum2 INTEGER,
	propertynum3 INTEGER,
	propertynum4 INTEGER,
	propertynum5 INTEGER,
	propertynum6 INTEGER,
	propertytex1 VARCHAR(250),
	propertytex2 VARCHAR(250),
	propertytex3 VARCHAR(250),
	propertytex4 VARCHAR(250),
	propertytex5 VARCHAR(250),
	propertytex6 VARCHAR(250),
	publisher INTEGER,
	publishdate DATE,
	PRIMARY KEY (nr),
	FOREIGN KEY (producer) REFERENCES producer (nr)
);

CREATE TABLE producttype (
	nr INTEGER NOT NULL,
	label VARCHAR(100),
	comment VARCHAR(2000),
	parent INTEGER,
	publisher INTEGER,
	publishdate DATE,
	PRIMARY KEY (nr)
);

CREATE TABLE producttypeproduct (
	product INTEGER NOT NULL,
	producttype INTEGER NOT NULL,
	PRIMARY KEY (product, producttype),
	FOREIGN KEY (product) REFERENCES product (nr)
);

CREATE TABLE productfeature (
	nr INTEGER NOT NULL,
	label VARCHAR(100),
	comment VARCHAR(2000),
	publisher INTEGER,
	publishdate DATE,
	PRIMARY KEY (nr)
);

CREATE TABLE productfeatureproduct (
	product INTEGER NOT NULL,
	productfeature INTEGER NOT NULL,
	PRIMARY KEY (product, productfeature),
	FOREIGN KEY (product) REFERENCES product (nr)
);

CREATE TABLE vendor (
	nr INTEGER NOT NULL,
	label VARCHAR(100),
	comment VARCHAR(2000),
	homepage VARCHAR(100),
	country CHAR(2),
	publisher INTEGER,
	publishdate DATE,
	PRIMARY KEY (nr)
);

CREATE TABLE offer (
	nr INTEGER NOT NULL,
	product INTEGER,
	producer INTEGER,
	vendor INTEGER,
	price DOUBLE PRECISION,
	validfrom TIMESTAMP,
	validto TIMESTAMP,
	deliverydays INTEGER,
	offerwebpage VARCHAR(100),
	publisher INTEGER,
	publishdate DATE,
	PRIMARY KEY (nr),
	FOREIGN KEY (producer) REFERENCES producer (nr),
	FOREIGN KEY (product) REFERENCES product (nr),
	FOREIGN KEY (vendor) REFERENCES vendor (nr)
);

CREATE TABLE person (
	nr INTEGER NOT NULL,
	name VARCHAR(30),
	mbox_sha1sum CHAR(40),
	country CHAR(2),
	publisher INTEGER,
	publishdate DATE,
	PRIMARY KEY (nr)
);

CREATE TABLE review (
	nr INTEGER NOT NULL,
	product INTEGER,
	producer INTEGER,
	person INTEGER,
	reviewdate TIMESTAMP,
	title VARCHAR(600),
	text TEXT,
	language CHAR(2),
	rating1 INTEGER,
	rating2 INTEGER,
	rating3 INTEGER,
	rating4 INTEGER,
	publisher INTEGER,
	publishdate DATE,
	PRIMARY KEY (nr),
	FOREIGN KEY (producer) REFERENCES producer (nr),
	FOREIGN KEY (product) REFERENCES product (nr),
	FOREIGN KEY (person) REFERENCES person (nr)
);
