CREATE TABLE product2 (
        nr int NOT NULL,
        label varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
        comment varchar(2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
        producer int NULL,
        propertynum1 int NULL,
        propertynum2 int NULL,
        propertynum3 int NULL,
        propertynum4 int NULL,
        propertynum5 int NULL,
        propertynum6 int NULL,
        propertytex1 varchar(250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
        propertytex2 varchar(250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
        propertytex3 varchar(250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
        propertytex4 varchar(250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
        propertytex5 varchar(250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
        propertytex6 varchar(250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
        publisher int NULL,
        publishdate date NULL,
        CONSTRAINT product2_pkey PRIMARY KEY (nr)
);

CREATE TABLE productfeatureproduct2 (
        product int NOT NULL,
        productfeature int NOT NULL,
        CONSTRAINT productfeatureproduct2_pkey PRIMARY KEY (product,productfeature)
);

CREATE TABLE producttypeproduct2 (
        product int NOT NULL,
        producttype int NOT NULL,
        CONSTRAINT producttypeproduct2_pkey PRIMARY KEY (product,producttype)
);
