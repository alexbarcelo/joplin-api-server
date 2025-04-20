#!/bin/sh

JOPLIN_CMD="/usr/local/bin/joplin --profile /joplin-profile"

# Switch among different Joplin values
case "$JOPLIN_SYNC_TARGET" in
    "none")
        JOPLIN_SYNC_TARGET=0
        ;;
    "filesystem")
        JOPLIN_SYNC_TARGET=2
        ;;
    "onedrive")
        JOPLIN_SYNC_TARGET=3
        ;;
    "nextcloud")
        JOPLIN_SYNC_TARGET=5
        ;;
    "webdav")
        JOPLIN_SYNC_TARGET=6
        ;;
    "dropbox")
        JOPLIN_SYNC_TARGET=7
        ;;
    "s3")
        JOPLIN_SYNC_TARGET=8
        ;;
    "joplin_server")
        JOPLIN_SYNC_TARGET=9
        ;;
    "joplin_cloud")
        JOPLIN_SYNC_TARGET=10
        ;;
    *)
        echo "Invalid sync target specified. Defaulting to None."
        JOPLIN_SYNC_TARGET=0
esac

$JOPLIN_CMD config sync.target $JOPLIN_SYNC_TARGET

if [ ! -z "$JOPLIN_SYNC_URL" ]; then
    $JOPLIN_CMD config sync.$JOPLIN_SYNC_TARGET.url $JOPLIN_SYNC_URL
fi

if [ ! -z "$JOPLIN_SYNC_PATH" ]; then
    $JOPLIN_CMD config sync.$JOPLIN_SYNC_TARGET.path $JOPLIN_SYNC_PATH
fi

if [ ! -z "$JOPLIN_SYNC_USERNAME" ]; then
    $JOPLIN_CMD config sync.$JOPLIN_SYNC_TARGET.username $JOPLIN_SYNC_USERNAME
fi

if [ ! -z "$JOPLIN_SYNC_PASSWORD" ]; then
    $JOPLIN_CMD config sync.$JOPLIN_SYNC_TARGET.password $JOPLIN_SYNC_PASSWORD
fi

if [ ! -z "$JOPLIN_API_TOKEN" ]; then
    $JOPLIN_CMD config api.token $JOPLIN_API_TOKEN
fi

if [ ! -z $JOPLIN_SYNC_INTERVAL ]; then
    $JOPLIN_CMD config sync.interval $JOPLIN_SYNC_INTERVAL
fi

echo $#

if [ $# -gt 0 ]; then
    exec $JOPLIN_CMD "$@"
else
    exec $JOPLIN_CMD server start
fi
