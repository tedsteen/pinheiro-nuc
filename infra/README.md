## First time setup
### InfluxDB
* Populate the secrets
### Grafana
* Add influxdb datasource here: http://grafana.pinheiro.s3n.io/connections/datasources/new
    * Use flux as query language
    * URL: `http://influxdb:8086`
    * Disable all Auth
    * Organization: `pinheiro`
    * Token: <from-influxdb-secrets>
    * Default bucket: `everything`
* Import the dashboard with id `15001` (Home Assistant state changes) [here](http://grafana.pinheiro.s3n.io/dashboard/import) using the newly created datasource
