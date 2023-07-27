#!/bin/bash
set -e

# -- Script to connect to MongoDB instance for source s2p --
# just run this script without parameters to connect
# any parameter will be appended to mongosh client (e.g., add --help to display mongosh help)
# note: the script uses the mongosh executable in the same docker container of source s2p

echo -e '\nCommands to connect to DB and display its content (e.g., for collection person):\n'
echo -e 'use s2p'
echo -e 'show collections'
echo -e 'db.person.countDocuments();'
echo -e 'db.person.findOne();'
echo -e 'exit\n'

cd "$(dirname "$(readlink -f "$0")")"/..
source .env
docker exec -it ${COMPOSE_PROJECT_NAME}-source-s2p mongo -u ${USERID} -p ${USERPWD} "$@"
