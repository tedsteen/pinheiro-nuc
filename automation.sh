#!/bin/bash
CMD=$1
export CONFIG_PATH=${2:-/var/lib/fast/config/automation}
case "$CMD" in
    up)
        docker-compose -f automation/docker-compose.yaml pull
        docker-compose -f automation/docker-compose.yaml up -d --build --remove-orphans
        ;;
    down)
        docker-compose -f automation/docker-compose.yaml down
        ;;
    *)
        echo "Usage: $0 up|down"
        exit 1
        ;;
esac

exit 0