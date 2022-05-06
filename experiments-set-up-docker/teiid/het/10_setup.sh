#!/bin/bash

echo "Setting up CSV files for source s4p: offer.csv, vendor.csv, producer.csv"
mkdir -p /opt/jboss/wildfly/standalone/s4p
gzip -cd /data/offer.csv.gz > /opt/jboss/wildfly/standalone/s4p/offer.csv
gzip -cd /data/vendor.csv.gz > /opt/jboss/wildfly/standalone/s4p/vendor.csv
gzip -cd /data/producer.csv.gz > /opt/jboss/wildfly/standalone/s4p/producer.csv

echo "Setting up CSV files for source s5p: product2.csv, productfeatureproduct2.csv, producttypeproduct2.csv"
mkdir -p /opt/jboss/wildfly/standalone/s5p
gzip -cd /data/product2.csv.gz > /opt/jboss/wildfly/standalone/s5p/product2.csv
gzip -cd /data/productfeatureproduct2.csv.gz > /opt/jboss/wildfly/standalone/s5p/productfeatureproduct2.csv
gzip -cd /data/producttypeproduct2.csv.gz > /opt/jboss/wildfly/standalone/s5p/producttypeproduct2.csv
