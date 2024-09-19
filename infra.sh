#!/bin/bash
CMD=$1
export CONFIG_PATH=${2:-/var/lib/fast/config}
case "$CMD" in
    up)
        docker-compose -f infra/docker-compose.yaml pull
        docker-compose -f infra/docker-compose.yaml up -d --build --remove-orphans
        ;;
    down)
        docker-compose -f infra/docker-compose.yaml down
        ;;
    *)
        echo "Usage: $0 up|down"
        exit 1
        ;;
esac

exit 0