#!/bin/sh

JOPLIN_CMD="/usr/local/bin/joplin --profile /joplin-profile"

./config.sh

LOOP_INTERVAL=${1:-60} # Default to 60 seconds if not set

while true; do
    $JOPLIN_CMD sync
    sleep $LOOP_INTERVAL
done
# This script will run indefinitely, syncing every 60 seconds.