#!/bin/bash

echo "STARTING REDASH - $1"

if [ ! -f db_created ]; then
    echo "First run detected. Executing /app/bin/docker-entrypoint server create_db"
    /app/bin/docker-entrypoint create_db
fi

/app/bin/docker-entrypoint $1
