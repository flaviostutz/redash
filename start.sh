#!/bin/bash

echo "STARTING REDASH - $1"

echo "Executing /app/bin/docker-entrypoint server create_db..."
cd /app
until /app/bin/docker-entrypoint create_db
do
    echo "Retrying..."
done

echo "Running $1..."
/app/bin/docker-entrypoint $1
