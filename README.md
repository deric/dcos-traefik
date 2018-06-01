# dcos-traefik

[Traefik](https://traefik.io) package for DC/OS.

`traefik.toml` configuration file is generated using `confd` template. Currently configuration can be loaded from ENV variables, evetually support for consistent key-value storages like Etcd, ZooKeeper, Consul can be added.

## Global configuration

 * `TRAEFIK_DEBUG` Default `false`
 * `TRAEFIK_INSECURE_SKIP` Default `false`
 * `TRAEFIK_LOG_LEVEL` Default `INFO`
 * `TRAEFIK_SSL_PATH` Default `$(pwd)/certs`

## Endpoints

### http

* `TRAEFIK_HTTP_COMPRESSION` Default `true`
* `TRAEFIK_HTTP_ADDRESS`
* `TRAEFIK_HTTP_PORT` Default `80`

### https

 * `TRAEFIK_HTTPS_COMPRESSION` Default `true`
 * `TRAEFIK_HTTPS_ENABLE` Default `false`
 * `TRAEFIK_HTTPS_ADDRESS`
 * `TRAEFIK_HTTPS_PORT` Default `443`

### ping

Heath check endpoint, responds without authentication to `/ping`.

 * `TRAEFIK_PING_ENABLE` Default `true`
 * `TRAEFIK_PING_PORT` Default `8082`

### API

 * `TRAEFIK_API_ENABLE` Default `true`
 * `TRAEFIK_API_PORT` Default `8083`
 * `TRAEFIK_API_DASHBOARD` Default `true`
 * `TRAEFIK_API_DEBUG` Default `false`


 * `TRAEFIK_ADMIN_READ_ONLY` Default `false`
 * `TRAEFIK_ADMIN_STATISTICS` Default `10`
 * `TRAEFIK_ADMIN_AUTH_METHOD` Default `basic`
 * `TRAEFIK_ADMIN_AUTH_USERS`

 * `CATTLE_URL`
 * `CATTLE_ACCESS_KEY`
 * `CATTLE_SECRET_KEY`

## Custom configuration

Appends custom configuration to generated `traefik.toml` config.

 * `TRAEFIK_FILE_NAME` Default `rules.toml`
 * `TRAEFIK_FILE_WATCH` Default `true`

## Let's Encrypt

 * `TRAEFIK_ACME_ENABLE` Certificates from Let's Encrypt. Default `false`
 * `TRAEFIK_ACME_EMAIL`
 * `TRAEFIK_ACME_ENTRYPOINT` Default `https`.
 * `TRAEFIK_ACME_STORAGE` File or key used for certificates storage.
 * `TRAEFIK_ACME_ONHOSTRULE` Default `false`
 * `TRAEFIK_ACME_CASERVER` Default `https://acme-v01.api.letsencrypt.org/directory`

## Metrics

### Prometheus

Will be enabled when `TRAEFIK_PROMETHEUS_ENTRYPOINT` is set, e.g. to `api`.

 * `TRAEFIK_PROMETHEUS_ENTRYPOINT`
 * `TRAEFIK_PROMETHEUS_BUCKETS` Comma separated values. Default `0.1,0.3,1.2,5.0`

## Providers

### Marathon

 * `TRAEFIK_MARATHON_ENABLE` Default `false`
 * `TRAEFIK_MARATHON_ENDPOINT` `http://marathon.mesos:8080`
 * `TRAEFIK_MARATHON_WATCH` Default `true`
 * `TRAEFIK_MARATHON_LB_COMPATIBILITY` Default `false`
 * `TRAEFIK_MARATHON_DOMAIN` Default `marathon.localhost`
 * `TRAEFIK_MARATHON_EXPOSE` Expose Marathon apps by default in Traefik. Default `true`
 * `TRAEFIK_MARATHON_GROUPS_AS_SUBDOMAINS` Convert Marathon groups to subdomains. Default `false`
 * `TRAEFIK_MARATHON_DIALER_TIMEOUT` Default `60s`
 * `TRAEFIK_MARATHON_KEEP_ALIVE` Default `10s`
 * `TRAEFIK_MARATHON_FORCE_TASK_HOSTNAME` Default `false`
 * `TRAEFIK_MARATHON_RESPECT_READINESS_CHECKS` Default `false`

### Mesos

 * `TRAEFIK_MESOS_ENABLE` Default `false`
 * `TRAEFIK_MESOS_ENDPOINT` `http://leader.mesos:5050`
 * `TRAEFIK_MESOS_WATCH` Default `true`
 * `TRAEFIK_MESOS_EXPOSE` Expose Mesos apps by default in Traefik. Default `false`
 * `TRAEFIK_MESOS_FILENAME` Override default configuration template.
 * `TRAEFIK_MESOS_ZK_TIMEOUT` Zookeeper timeout (in seconds).
 * `TRAEFIK_MESOS_REFRESH` Polling interval (in seconds).
 * `TRAEFIK_MESOS_IP_SOURCES` IP sources (e.g. host, docker, mesos, netinfo).
 * `TRAEFIK_MESOS_TIMEOUT` HTTP Timeout (in seconds).
 * `TRAEFIK_MESOS_GROUPS_AS_SUBDOMAINS` Convert Mesos groups to subdomains. Default `false`

### Kubernetess

 * `TRAEFIK_K8S_ENABLE` Default `false`
 * `TRAEFIK_K8S_OPTS`


### Rancher

 * `TRAEFIK_RANCHER_ENABLE` Default `false`
 * `TRAEFIK_RANCHER_REFRESH` Default `15`
 * `TRAEFIK_RANCHER_MODE` Default `api`
 * `TRAEFIK_RANCHER_DOMAIN` Default `rancher.localhost`
 * `TRAEFIK_RANCHER_EXPOSE` Default `true`
 * `TRAEFIK_RANCHER_FILENAME` Configuration template.
 * `TRAEFIK_RANCHER_HEALTHCHECK` Filter services with unhealthy states and inactive states. Default `true`
 * `TRAEFIK_RANCHER_INTERVALPOLL` Default `false`
 * `TRAEFIK_RANCHER_PREFIX` Default `/latest`
