CREATE TABLE op1
(
    o_nr integer NOT NULL,
    o_price double precision,
    o_vendor integer,
    o_validto date,
    o_deliverydays integer,
    o_offerwebpages character varying(100) COLLATE pg_catalog."default",
    p_nr integer NOT NULL,
    p_label character varying(100) COLLATE pg_catalog."default",
    p_propertynum1 integer,
    p_propertynum2 integer,
    CONSTRAINT op1_pkey PRIMARY KEY (o_nr, p_nr)
);

CREATE TABLE op2
(
    o_nr integer NOT NULL,
    o_price double precision,
    o_vendor integer,
    o_validto date,
    o_deliverydays integer,
    o_offerwebpages character varying(100) COLLATE pg_catalog."default",
    p_nr integer NOT NULL,
    p_label character varying(100) COLLATE pg_catalog."default",
    p_propertynum1 integer,
    p_propertynum2 integer,
    CONSTRAINT op2_pkey PRIMARY KEY (o_nr, p_nr)
);

CREATE TABLE pfpf1
(
    product integer NOT NULL,
    productfeature integer NOT NULL,
    f_label character varying(100) COLLATE pg_catalog."default",
    f_publisher integer,
    f_publishdate date,
    CONSTRAINT pfpf1_pkey PRIMARY KEY (product, productfeature)
);


CREATE TABLE pfpf2
(
    product integer NOT NULL,
    productfeature integer NOT NULL,
    f_label character varying(100) COLLATE pg_catalog."default",
    f_publisher integer,
    f_publishdate date,
    CONSTRAINT pfpf2_pkey PRIMARY KEY (product, productfeature)
);


CREATE TABLE ppd1
(
    p_nr integer NOT NULL,
    p_label character varying(100) COLLATE pg_catalog."default",
    p_comment character varying(2000) COLLATE pg_catalog."default",
    p_propertytex1 character varying(250) COLLATE pg_catalog."default",
    p_propertytex2 character varying(250) COLLATE pg_catalog."default",
    p_propertytex3 character varying(250) COLLATE pg_catalog."default",
    p_propertytex4 character varying(250) COLLATE pg_catalog."default",
    p_propertytex5 character varying(250) COLLATE pg_catalog."default",
    p_propertynum1 integer,
    p_propertynum2 integer,
    p_propertynum4 integer,
    pd_producer integer NOT NULL,
    pd_label character varying(100) COLLATE pg_catalog."default",
    pd_country character varying(2) COLLATE pg_catalog."default",
    CONSTRAINT ppd1_pkey PRIMARY KEY (p_nr, pd_producer)
);

CREATE TABLE ppd2
(
    p_nr integer NOT NULL,
    p_label character varying(100) COLLATE pg_catalog."default",
    p_comment character varying(2000) COLLATE pg_catalog."default",
    p_propertytex1 character varying(250) COLLATE pg_catalog."default",
    p_propertytex2 character varying(250) COLLATE pg_catalog."default",
    p_propertytex3 character varying(250) COLLATE pg_catalog."default",
    p_propertytex4 character varying(250) COLLATE pg_catalog."default",
    p_propertytex5 character varying(250) COLLATE pg_catalog."default",
    p_propertynum1 integer,
    p_propertynum2 integer,
    p_propertynum4 integer,
    pd_producer integer NOT NULL,
    pd_label character varying(100) COLLATE pg_catalog."default",
    pd_country character varying(2) COLLATE pg_catalog."default",
    CONSTRAINT ppd2_pkey PRIMARY KEY (p_nr, pd_producer)
);

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

CREATE TABLE product2
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
    CONSTRAINT product2_pkey PRIMARY KEY (nr)
);


CREATE TABLE productfeatureproduct1
(
    product integer NOT NULL,
    productfeature integer NOT NULL,
    CONSTRAINT productfeatureproduct1_pkey PRIMARY KEY (product, productfeature)
);

CREATE TABLE productfeatureproduct2
(
    product integer NOT NULL,
    productfeature integer NOT NULL,
    CONSTRAINT productfeatureproduct2_pkey PRIMARY KEY (product, productfeature)
);

CREATE TABLE productfeature
(
    nr integer NOT NULL,
    label character varying(100) COLLATE pg_catalog."default",
    comment character varying(2000) COLLATE pg_catalog."default",
    publisher integer,
    publishdate date,
    CONSTRAINT productfeature_pkey PRIMARY KEY (nr)
);

CREATE TABLE offer
(
    nr integer NOT NULL,
    product integer,
    producer integer,
    vendor integer,
    price double precision,
    validfrom date,
    validto date,
    deliverydays integer,
    offerwebpage character varying(100) COLLATE pg_catalog."default",
    publisher integer,
    publishdate date,
    CONSTRAINT offer_pkey PRIMARY KEY (nr)
);

CREATE TABLE producer
(
    nr integer NOT NULL,
    label character varying(100) COLLATE pg_catalog."default",
    comment character varying(2000) COLLATE pg_catalog."default",
    homepage character varying(100) COLLATE pg_catalog."default",
    country character(2) COLLATE pg_catalog."default",
    publisher integer,
    publishdate date,
    CONSTRAINT producer_pkey PRIMARY KEY (nr)
);