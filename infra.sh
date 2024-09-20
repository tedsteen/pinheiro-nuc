#!/bin/bash
CMD=$1
export CONFIG_PATH=${2:-/var/lib/fast/config/infra}
case "$CMD" in
    up)
        docker-compose -f infra/docker-compose.yaml pull
        docker-compose -f infra/docker-compose.yaml up -d --build --remove-orphans
        ;;
    down)
        docker-compose -f infra/docker-compose.yaml down
        ;;
    restart)
        docker-compose -f infra/docker-compose.yaml restart
        ;;
    *)
        echo "Usage: $0 up|down|restart"
        ;;
esac

exit 0