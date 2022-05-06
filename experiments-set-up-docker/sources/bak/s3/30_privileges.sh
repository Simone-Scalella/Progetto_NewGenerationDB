#!/bin/bash
set -e

echo "USE s3; GRANT ALL PRIVILEGES TO $MSSQL_USER" | /opt/mssql-tools/bin/sqlcmd -U SA -P $SA_PASSWORD -X

