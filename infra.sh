#!/bin/bash
CMD=$1
ROOT_PATH=${2:-$(pwd)/config}
export CONFIG_PATH=$ROOT_PATH/infra
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
        exit 1
        ;;
esac

exit 0