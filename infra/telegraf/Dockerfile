FROM telegraf:alpine
COPY telegraf.conf /etc/telegraf/telegraf.conf
# NOTE: To be able to access the docker.sock we need to do this (see: https://github.com/influxdata/telegraf/issues/10031#issuecomment-1026012770)
#       Also, I could not make use of the `[[secretstores.docker]]` due to this bug: https://community.influxdata.com/t/influxdbv2-authorization-fails-if-docker-secrets-are-used/32809
#       So passing the secret through environment variables here instead
USER root

ENTRYPOINT /bin/sh -c "export INFLUXDB_ADMIN_TOKEN=\$(cat /run/secrets/influxdb-admin-token) && telegraf"