#!/bin/bash

for f in /docker-entrypoint-initdb.d/*; do
	case $f in
	*.sh)  echo "Running $f" ; /bin/bash $f ;;
	*.sql) echo "Running $f" ; su - db2inst1 -c 'db2 -tmf '$f ;;
	*)     echo "Skipped $f" ;;
    esac
done
