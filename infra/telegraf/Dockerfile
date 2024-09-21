FROM telegraf:alpine
COPY telegraf.conf /etc/telegraf/telegraf.conf

# NOTE: Could not make use of the `[[secretstores.docker]]` due to this bug: https://community.influxdata.com/t/influxdbv2-authorization-fails-if-docker-secrets-are-used/32809
#       So passing the secret through environment variables here instead
CMD /bin/sh -c "export INFLUXDB_ADMIN_TOKEN=\$(cat /run/secrets/influxdb-admin-token) && telegraf"