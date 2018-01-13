#!/bin/bash

echo "STARTING REDASH - $1"

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

echo "Running $1..."
/app/bin/docker-entrypoint $1

