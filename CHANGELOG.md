# dcos-traefik Changelog

## v1.1.0
  - Traefik configuration generated from `confd` template
  - Rename `TRAEFIK_ADMIN_*` variables to `TRAEFIK_API_*`, `TRAEFIK_PING_*` see [documentation](https://docs.traefik.io/configuration/backends/web/)
  - Removed `TRAEFIK_PROMETHEUS_ENABLE`, setting value to `TRAEFIK_PROMETHEUS_ENTRYPOINT` is enough.
  - Renamed `TRAEFIK_MARATHONLB_COMPATIBILITY` to `TRAEFIK_MARATHON_LB_COMPATIBILITY`

## v1.0.0
 - initial release
