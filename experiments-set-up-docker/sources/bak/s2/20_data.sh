#!/bin/bash
set -e

for table in producer product producttype producttypeproduct productfeature productfeatureproduct vendor offer person review; do
	csv=/data/$table.csv.gz
	if [ -f "$csv" ]; then
		echo -e "\nLoading $csv"
		sql="SET GLOBAL local_infile=1; LOAD DATA LOCAL INFILE '/dev/stdin' INTO TABLE $table CHARACTER SET utf8 FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"' IGNORE 1 LINES;"
		zcat $csv | mysql --local-infile=1 -u "root" -p"$MYSQL_PASSWORD" "$MYSQL_DATABASE" -e "$sql"
	fi
done
