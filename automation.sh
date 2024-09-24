#!/bin/bash
CMD=$1
ROOT_PATH=${2:-$(pwd)/config}
export CONFIG_PATH=$ROOT_PATH/automation
case "$CMD" in
    up)
        docker-compose -f automation/docker-compose.yaml pull
        docker-compose -f automation/docker-compose.yaml up -d --build --remove-orphans
        ;;
    down)
        docker-compose -f automation/docker-compose.yaml down
        ;;
    restart)
        docker-compose -f automation/docker-compose.yaml restart
        ;;
    *)
        echo "Usage: $0 up|down|restart"
        exit 1
        ;;
esac

exit 0