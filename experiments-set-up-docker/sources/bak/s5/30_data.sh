#!/bin/bash
set -e

for table in producer product producttype producttypeproduct productfeature productfeatureproduct vendor offer person review; do
	csv=/data/$table.csv.gz
	if [ -f "$csv" ]; then
		echo -e "\nLoading $csv"
		gzip -cd $csv | tail -n+2 > /tmp/data.csv
		echo "CONNECT TO s4;" > /tmp/script.sql
		echo "IMPORT FROM '/tmp/data.csv' OF DEL INSERT INTO $table;" >> /tmp/script.sql
		echo "COMMIT WORK;" >> /tmp/script.sql
		echo "CONNECT RESET;" >> /tmp/script.sql
		echo "TERMINATE;" >> /tmp/script.sql
		su - db2inst1 -c 'db2 -tmf /tmp/script.sql || true'
		rm /tmp/data.csv /tmp/script.sql
	fi
done
