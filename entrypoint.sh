#!/bin/sh

JOPLIN_CMD="/usr/local/bin/joplin --profile /joplin-profile"

./config.sh

exec $JOPLIN_CMD "$@"
