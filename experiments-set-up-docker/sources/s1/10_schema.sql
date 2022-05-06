CREATE TABLE product1
(
    nr integer NOT NULL,
    label character varying(100) COLLATE pg_catalog."default",
    comment character varying(2000) COLLATE pg_catalog."default",
    producer integer,
    propertynum1 integer,
    propertynum2 integer,
    propertynum3 integer,
    propertynum4 integer,
    propertynum5 integer,
    propertynum6 integer,
    propertytex1 character varying(250) COLLATE pg_catalog."default",
    propertytex2 character varying(250) COLLATE pg_catalog."default",
    propertytex3 character varying(250) COLLATE pg_catalog."default",
    propertytex4 character varying(250) COLLATE pg_catalog."default",
    propertytex5 character varying(250) COLLATE pg_catalog."default",
    propertytex6 character varying(250) COLLATE pg_catalog."default",
    publisher integer,
    publishdate date,
    CONSTRAINT product1_pkey PRIMARY KEY (nr)
);

CREATE TABLE productfeatureproduct1
(
    product integer NOT NULL,
    productfeature integer NOT NULL,
    CONSTRAINT productfeatureproduct1_pkey PRIMARY KEY (product, productfeature)
);

CREATE TABLE producttypeproduct1
(
    product integer NOT NULL,
    producttype integer NOT NULL,
    CONSTRAINT producttypeproduct1_pkey PRIMARY KEY (product, producttype)
);

CREATE TABLE review
(
    nr integer NOT NULL,
    product integer,
    producer integer,
    person integer,
    reviewdate date,
    title character varying(600) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
    text varchar(8192) COLLATE pg_catalog."default",
    language character(2) COLLATE pg_catalog."default" DEFAULT NULL::bpchar,
    rating1 integer,
    rating2 integer,
    rating3 integer,
    rating4 integer,
    publisher integer,
    publishdate date,
    CONSTRAINT reviewc_pkey PRIMARY KEY (nr)
);
