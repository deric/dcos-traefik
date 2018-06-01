# dcos-traefik Changelog

## v1.1.0
  - Traefik configuration generated from `confd` template
  - Targets Traefik 1.6.x release
  - Rename `TRAEFIK_ADMIN_*` variables to `TRAEFIK_API_*`, `TRAEFIK_PING_*` see [documentation](https://docs.traefik.io/configuration/backends/web/)
  - Renamed `TRAEFIK_MARATHONLB_COMPATIBILITY` -> `TRAEFIK_MARATHON_LB_COMPATIBILITY`
  - Renamed `TRAEFIK_ADMIN_ENABLE` -> `TRAEFIK_API_ENABLE`
  - Renamed `TRAEFIK_ADMIN_PORT` -> `TRAEFIK_API_PORT`
  - Renamed `TRAEFIK_RANCHER_EXPOSED` -> `TRAEFIK_RANCHER_EXPOSE`
  - Renamed `TRAEFIK_ADMIN_STATISTICS` -> `TRAEFIK_STATISTICS_RECENT_ERRORS`
  - Removed `TRAEFIK_PROMETHEUS_ENABLE`, setting value to `TRAEFIK_PROMETHEUS_ENTRYPOINT` is enough.
  - Removed deprecated directives:
    * `TRAEFIK_ACME_ONDEMAND`
    * `TRAEFIK_ADMIN_READ_ONLY`
    * `TRAEFIK_ADMIN_AUTH_METHOD`
    * `TRAEFIK_ADMIN_AUTH_USERS`
  - Added Mesos provider
  - Improved Kubernetess support
  - Added Metrics support (exporting to DataDog, InfluxDB, StatsD)

## v1.0.0
 - Initial release
 - Targets Traefik 1.5.x release
