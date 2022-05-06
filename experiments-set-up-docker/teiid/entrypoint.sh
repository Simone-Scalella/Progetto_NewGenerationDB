#!/bin/bash
set -e
shopt -s nullglob

TEIID_ADMIN_USERNAME=${TEIID_ADMIN_USERNAME:-teiid}
TEIID_ADMIN_PASSWORD=${TEIID_ADMIN_PASSWORD:-teiid}

TEIID_APP_USERNAME=${TEIID_APP_USERNAME:-teiid}
TEIID_APP_PASSWORD=${TEIID_APP_PASSWORD:-teiid}

TEIID_APP_GROUP=${TEIID_APP_GROUP:-"odata,rest"}
TEIID_APP_REALM=${TEIID_APP_REALM:-ApplicationRealm}

cd $JBOSS_HOME

if [ ! -f "standalone/data/initialized" ]; then
  touch standalone/data/initialized

  echo "Initializing Teiid"

  bin/add-user.sh --silent --enable -u ${TEIID_ADMIN_USERNAME} -p ${TEIID_ADMIN_PASSWORD}
  bin/add-user.sh --silent --enable -u ${TEIID_APP_USERNAME} -p ${TEIID_APP_PASSWORD} -r ${TEIID_APP_REALM} -g ${TEIID_APP_GROUP} -a
  
  bin/standalone.sh -c standalone-teiid.xml -b 127.0.0.1 -bmanagement 127.0.0.1 & 
  sleep 20 # TODO: remove hack and rather wait for teiid port 9990 to be open
  
  if [ "$TEIID_LOG_SOURCE_QUERIES" = "1" ]; then
    echo "Enabling logging of source queries"
    bin/jboss-cli.sh --connect --command="/subsystem=logging/logger=org.teiid.COMMAND_LOG.SOURCE:add"
    bin/jboss-cli.sh --connect --command="/subsystem=logging/logger=org.teiid.COMMAND_LOG.SOURCE:write-attribute(name=\"level\", value=\"DEBUG\")"
    bin/jboss-cli.sh --connect --command="/subsystem=logging/console-handler=CONSOLE:change-log-level(level=\"DEBUG\")"
  fi

  for f in /docker-entrypoint-initdb.d/*; do
    case $f in
      *.sh)
        echo "Running $f"
        /bin/bash $f
        ;;
      *.cli)
        echo "Running $f"
        n=`basename -- "$f"`
        envsubst < $f > standalone/data/${n%.cli}-expanded.cli
        bin/jboss-cli.sh --connect --file=standalone/data/${n%.cli}-expanded.cli
        ;;
    esac
  done

  for f in /docker-entrypoint-initdb.d/*-vdb.ddl; do
    echo "Deploying $f"
    n=`basename -- "$f"`
    envsubst < $f > standalone/data/$n
    bin/jboss-cli.sh --connect --command="deploy /opt/jboss/wildfly/standalone/data/$n"
  done

  sleep 5 # TODO: find better way to wait for metadata loaded

  bin/jboss-cli.sh --connect --command=:shutdown 
fi

exec bin/standalone.sh -c standalone-teiid.xml -b 0.0.0.0 -bmanagement 0.0.0.0
