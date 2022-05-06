#!/bin/bash
set -e

for table in review person
do
    csv=/data/$table.csv.gz
    if [ -f "$csv" ]; then
        echo -e "\nLoading $csv"
        header="`zcat $csv | head -n1 | tr -d '\r' | sed -E 's/,/, /g'`"  # returns "col1, ..., colN"
        varlist="`echo $header | sed -E 's/([^ ,]+)/@\1/g'`"  # returns "@col1, ..., @colN"
        setlist="`echo $header | sed -E 's/([^ ,]+)/\1 = NULLIF(@\1, '\'\'')/g'`"  # returns "col1 = NULLIF(@col1, ''), ..., colN = NULLIF(@colN, '')"
        sql="SET GLOBAL local_infile=1; LOAD DATA LOCAL INFILE '/dev/stdin' INTO TABLE $table CHARACTER SET utf8 FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"' IGNORE 1 LINES ($varlist) SET $setlist;"
        zcat $csv | mysql --local-infile=1 -u "root" -p"$MYSQL_PASSWORD" "$MYSQL_DATABASE" -e "$sql"
    fi
done
