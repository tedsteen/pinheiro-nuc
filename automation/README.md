## First time setup
### Home Assistant
* Allow access through reverse proxy by adding this to `configuration.yaml`
    ```yaml
    http:
    use_x_forwarded_for: true
    trusted_proxies:
        - 172.18.0.0/16 # Docker bridge network range
    ```
### Node Red
* Install these palettes
    * https://flows.nodered.org/node/node-red-contrib-home-assistant-websocket
        * Follow [this guide](https://zachowj.github.io/node-red-contrib-home-assistant-websocket/guide/#configuration) to connect Node Red with HASS
