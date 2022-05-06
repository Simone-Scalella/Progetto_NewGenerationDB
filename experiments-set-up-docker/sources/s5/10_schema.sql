USE s5

CREATE TABLE product2
(
    nr integer NOT NULL,
    label character varying(100),
    comment character varying(2000),
    producer integer,
    propertynum1 integer,
    propertynum2 integer,
    propertynum3 integer,
    propertynum4 integer,
    propertynum5 integer,
    propertynum6 integer,
    propertytex1 character varying(250),
    propertytex2 character varying(250),
    propertytex3 character varying(250),
    propertytex4 character varying(250),
    propertytex5 character varying(250),
    propertytex6 character varying(250),
    publisher integer,
    publishdate date,
    CONSTRAINT product2_pkey PRIMARY KEY (nr)
);

CREATE TABLE productfeatureproduct2
(
    product integer NOT NULL,
    productfeature integer NOT NULL,
    CONSTRAINT productfeatureproduct2_pkey PRIMARY KEY (product, productfeature)
);

CREATE TABLE producttypeproduct2
(
    product integer NOT NULL,
    producttype integer NOT NULL,
    CONSTRAINT producttypeproduct2_pkey PRIMARY KEY (product, producttype)
);
