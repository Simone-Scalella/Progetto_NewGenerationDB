
-- DATABASE DEFINITION --

CREATE DATABASE homogeneous;
USE DATABASE homogeneous; 

-- SERVER DEFINITIONS --

CREATE SERVER s1_source FOREIGN DATA WRAPPER postgresql OPTIONS ( "resource-name" 'java:/s1' );
CREATE SERVER s2_source FOREIGN DATA WRAPPER mysql OPTIONS ( "resource-name" 'java:/s2' );
CREATE SERVER s3_source FOREIGN DATA WRAPPER sqlserver OPTIONS ( "resource-name" 'java:/s3' );
CREATE SERVER s4_source FOREIGN DATA WRAPPER db2 OPTIONS ( "resource-name" 'java:/s4' );
CREATE SERVER s5_source FOREIGN DATA WRAPPER sqlserver OPTIONS ( "resource-name" 'java:/s5' );

CREATE SERVER smatv_source FOREIGN DATA WRAPPER postgresql OPTIONS ( "resource-name" 'java:/smatv' );

-- SCHEMA DEFINITIONS --

CREATE SCHEMA ss1 SERVER s1_source;
CREATE SCHEMA ss2 SERVER s2_source;
CREATE SCHEMA ss3 SERVER s3_source;
CREATE SCHEMA ss4 SERVER s4_source;
CREATE SCHEMA ss5 SERVER s5_source;

CREATE SCHEMA smatv SERVER smatv_source;

-- METADATA SETUP --

IMPORT FOREIGN SCHEMA public FROM SERVER s1_source INTO ss1 OPTIONS ( importer.catalog 'public' );
IMPORT FOREIGN SCHEMA s2 FROM SERVER s2_source INTO ss2 OPTIONS ( importer.catalog 's2' );
IMPORT FOREIGN SCHEMA dbo FROM SERVER s3_source INTO ss3;
-- IMPORT FOREIGN SCHEMA db2inst1 FROM SERVER s4_source INTO ss4 OPTIONS ( importer.catalog 'db2inst1' ); -- DB2 reports memory errors 
IMPORT FOREIGN SCHEMA dbo FROM SERVER s5_source INTO ss5;
IMPORT FOREIGN SCHEMA public FROM SERVER smatv_source INTO smatv OPTIONS ( importer.catalog 'public' );

SET SCHEMA ss4;

CREATE FOREIGN TABLE producer (
    nr integer not null primary key,
    label varchar(100) default NULL,
    comment varchar(2000) default NULL,
    homepage varchar(100) default NULL,
    country varchar(2) default NULL,
    publisher integer,
    publishdate date
) OPTIONS(UPDATABLE 'FALSE');

CREATE FOREIGN TABLE offer (
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
    publishdate date,
    CONSTRAINT offer_fk FOREIGN KEY (vendor) REFERENCES vendor(nr)
) OPTIONS(UPDATABLE 'FALSE');

CREATE FOREIGN TABLE vendor (
    nr integer not null primary key,
    label varchar(100) default NULL,
    comment varchar(2000) default NULL,
    homepage varchar(100) default NULL,
    country varchar(2) default NULL,
    publisher integer,
    publishdate date
)OPTIONS(UPDATABLE 'FALSE');
