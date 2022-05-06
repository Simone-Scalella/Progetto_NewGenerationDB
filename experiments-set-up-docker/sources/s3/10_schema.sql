USE s3;

CREATE TABLE productfeature (
        nr int NOT NULL,
        label varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
        comment varchar(2000) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
        publisher int NULL,
        publishdate date NULL,
        CONSTRAINT productfeature_pkey PRIMARY KEY (nr)
);


CREATE TABLE producttype (
        nr int NOT NULL,
        label varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
        comment varchar(2000) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
        parent int NULL,
        publisher int NULL,
        publishdate date NULL,
        CONSTRAINT producttype_pkey PRIMARY KEY (nr)
);
