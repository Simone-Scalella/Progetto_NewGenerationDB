-- DATABASE DEFINITION --

CREATE DATABASE heterogeneous;
USE DATABASE heterogeneous;

-- SERVER DEFINITIONS --

CREATE SERVER s1_source FOREIGN DATA WRAPPER postgresql OPTIONS ( "resource-name" 'java:/s1' );
CREATE SERVER s2p_source FOREIGN DATA WRAPPER mongodb OPTIONS ( "resource-name" 'java:/s2p' );
CREATE SERVER s3_source FOREIGN DATA WRAPPER sqlserver OPTIONS ( "resource-name" 'java:/s3' );
CREATE SERVER s4p_source FOREIGN DATA WRAPPER file OPTIONS ( "resource-name" 'java:/s4p' );
CREATE SERVER s5p_source FOREIGN DATA WRAPPER file OPTIONS ( "resource-name" 'java:/s5p' );
CREATE SERVER smatv_source FOREIGN DATA WRAPPER postgresql OPTIONS ( "resource-name" 'java:/smatv' );

-- SCHEMA DEFINITIONS --

CREATE SCHEMA ss1 SERVER s1_source;
CREATE SCHEMA ss2 SERVER s2p_source;
CREATE SCHEMA ss3 SERVER s3_source;
CREATE SCHEMA s4p_filesystem SERVER s4p_source;
CREATE VIRTUAL SCHEMA ss4;
CREATE SCHEMA s5p_filesystem SERVER s5p_source;
CREATE VIRTUAL SCHEMA ss5;
CREATE SCHEMA smatv SERVER smatv_source;

-- METADATA SETUP --

IMPORT FOREIGN SCHEMA public FROM SERVER s1_source INTO ss1 OPTIONS ( importer.catalog 'public' );
IMPORT FOREIGN SCHEMA dbo FROM SERVER s3_source INTO ss3;
IMPORT FOREIGN SCHEMA public FROM SERVER s4p_source INTO s4p_filesystem;
IMPORT FOREIGN SCHEMA public FROM SERVER stp_source INTO s5p_filesystem;
IMPORT FOREIGN SCHEMA public FROM SERVER smatv_source INTO smatv OPTIONS ( importer.catalog 'public' );

SET SCHEMA ss2;

CREATE FOREIGN TABLE person (
    nr integer unique,
    name varchar(30) default NULL,
    mbox_sha1sum varchar(40) default NULL,
    country varchar(2) default NULL,
    publisher integer,
    publishdate date
) OPTIONS (UPDATABLE 'FALSE');

CREATE FOREIGN TABLE review (
    nr integer unique,
    product integer,
    producer integer,
    person integer,
    reviewdate date default NULL,
    title varchar(200) default NULL,
    text varchar(2048),
    "language" varchar(2) default NULL,
    rating1 integer default NULL,
    rating2 integer default NULL,
    rating3 integer default NULL,
    rating4 integer default NULL,
    publisher integer,
    publishdate date
) OPTIONS (UPDATABLE 'FALSE');

SET SCHEMA ss4;

CREATE VIEW producer (
    nr integer not null primary key,
    label varchar(100) default NULL,
    comment varchar(2000) default NULL,
    homepage varchar(100) default NULL,
    country varchar(2) default NULL,
    publisher integer,
    publishdate date
) AS
    SELECT  sp.nr, sp.label, sp.comment, sp.homepage, sp.country, sp.publisher, sp.publishdate
    FROM    (EXEC s4p_filesystem.getTextFiles('producer.csv')) AS f,
            TEXTTABLE(f.file COLUMNS
                nr integer,
                label string,
                comment string,
                homepage string,
                country string,
                publisher integer,
                publishdate date
            HEADER) AS sp;

CREATE VIEW offer (
    nr integer not null primary key,
    product integer,
    producer integer,
    vendor integer,
    price double default null,
    validfrom date default null,
    validto date default null,
    deliverydays integer default null,
    offerwebpage varchar(100) default NULL,
    publisher integer,
    publishdate date
) AS
    SELECT  sp.nr, sp.product, sp.producer, sp.vendor, sp.price, sp.validfrom, sp.validto, sp.deliverydays, sp.offerwebpage, sp.publisher, sp.publishdate
    FROM    (EXEC s4p_filesystem.getTextFiles('offer.csv')) AS f,
            TEXTTABLE(f.file COLUMNS
                nr integer,
                product integer,
                producer integer,
                vendor integer,
                price double,
                validfrom date,
                validto date,
                deliverydays integer,
                offerwebpage string,
                publisher integer,
                publishdate date
            HEADER) AS sp;

CREATE VIEW vendor (
    nr integer not null primary key,
    label varchar(100) default NULL,
    comment varchar(2000) default NULL,
    homepage varchar(100) default NULL,
    country varchar(2) default NULL,
    publisher integer,
    publishdate date
) AS
    SELECT  sp.nr, sp.label, sp.comment, sp.homepage, sp.country, sp.publisher, sp.publishdate
    FROM    (EXEC s4p_filesystem.getTextFiles('vendor.csv')) AS f,
            TEXTTABLE(f.file COLUMNS
                nr integer,
                label varchar(100),
                comment varchar(2000),
                homepage varchar(100),
                country varchar(2),
                publisher integer,
                publishdate date
            HEADER) AS sp;

SET SCHEMA ss5;

CREATE VIEW product2 (
    nr integer not null primary key,
    label varchar(100),
    comment varchar(2000),
    producer integer default NULL,
    propertynum1 integer default NULL,
    propertynum2 integer default NULL,
    propertynum3 integer default NULL,
    propertynum4 integer default NULL,
    propertynum5 integer default NULL,
    propertynum6 integer default NULL,
    propertytex1 varchar(250) default NULL,
    propertytex2 varchar(250) default NULL,
    propertytex3 varchar(250) default NULL,
    propertytex4 varchar(250) default NULL,
    propertytex5 varchar(250) default NULL,
    propertytex6 varchar(250) default NULL,
    publisher integer default NULL,
    publishdate date default NULL
) AS
    SELECT  sp.nr, sp.label,  sp.comment, sp.producer,
            sp.propertynum1, sp.propertynum2, sp.propertynum3, sp.propertynum4, sp.propertynum5, sp.propertynum6,
            sp.propertytex1, sp.propertytex2, sp.propertytex3, sp.propertytex4, sp.propertytex5, sp.propertytex6,
            sp.publisher, sp.publishdate
    FROM    (EXEC s5p_filesystem.getTextFiles('product2.csv')) AS f,
            TEXTTABLE(f.file COLUMNS
                nr integer,
                label varchar(100),
                comment varchar(2000),
                producer integer,
                propertynum1 integer,
                propertynum2 integer,
                propertynum3 integer,
                propertynum4 integer,
                propertynum5 integer,
                propertynum6 integer,
                propertytex1 varchar(250),
                propertytex2 varchar(250),
                propertytex3 varchar(250),
                propertytex4 varchar(250),
                propertytex5 varchar(250),
                propertytex6 varchar(250),
                publisher integer,
                publishdate date
            HEADER) AS sp;

CREATE VIEW productfeatureproduct2 (
    product integer not null,
    productfeature integer not null,
    primary key(product, productfeature)
) AS
    SELECT  sp.product, sp.productfeature
    FROM    (EXEC s5p_filesystem.getTextFiles('productfeatureproduct2.csv')) AS f,
            TEXTTABLE(f.file COLUMNS
                product integer,
                productfeature integer
            HEADER) AS sp;

CREATE VIEW producttypeproduct2 (
    product integer not null,
    producttype integer not null,
    primary key(product, producttype)
) AS
    SELECT  sp.product, sp.producttype
    FROM    (EXEC s5p_filesystem.getTextFiles('producttypeproduct2.csv')) AS f,
            TEXTTABLE(f.file COLUMNS
                product integer,
                producttype integer
            HEADER) AS sp;
