#!/bin/bash
set -e

for table in product2 producttypeproduct2 productfeatureproduct2
do
    csv=/data/$table.csv.gz
    if [ -f "$csv" ]; then
        echo -e "\nLoading $csv"
        gzip -cd $csv > /tmp/data.csv
        echo "USE s5; BULK INSERT $table FROM '/tmp/data.csv' WITH (FIRSTROW=2, FORMAT='CSV', FIELDQUOTE='\"', FIELDTERMINATOR=',');" | /opt/mssql-tools/bin/sqlcmd -U SA -P $SA_PASSWORD -X
        rm /tmp/data.csv
    fi
done
