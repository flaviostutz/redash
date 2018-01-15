#!/bin/bash

COMMAND=$1

if [ "$COMMAND" == "" ]; then
    COMMAND="server"
fi

echo "STARTING REDASH - $COMMAND"

if [ ! -f initdone ]; then
    echo "Executing /app/bin/docker-entrypoint server create_db..."
    cd /app
    until /app/bin/docker-entrypoint create_db
    do
        sleep 5
        echo "Retrying..."
    done
    touch initdone
fi

echo "Running $COMMAND..."
/app/bin/docker-entrypoint $COMMAND

