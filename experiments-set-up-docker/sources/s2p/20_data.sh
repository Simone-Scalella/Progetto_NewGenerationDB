#!/bin/bash
set -e

for table in review person
do
    gzip -dc /import/${table}.csv.gz | mongoimport -d s2p -c ${table} --type csv --headerline --ignoreBlanks
done
