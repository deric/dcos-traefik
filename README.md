# dcos-traefik

[Traefik](https://traefik.io) package for DC/OS.

`traefik.toml` configuration file is generated using `confd` template. Currently configuration can be loaded from ENV variables, evetually support for consistent key-value storages like Etcd, ZooKeeper, Consul can be added.

## Quickstart

In order to expose a service from Marathon add labels to your app:

```
labels: {
  "traefik.enable": "true",
  "traefik.frontend.rule": "Host:site.example.com",
  "traefik.protocol": "http",
  "traefik.backend.healthcheck.path": "/health",
  "traefik.frontend.entryPoints":"http,https"
}
```
Then you should be able to reach you site via Traefik's HTTP port (`TRAEFIK_HTTP_PORT`):
```
curl -H 'Host:site.example.com' localhost:80/health
```

See [documetation](https://docs.traefik.io/user-guide/marathon/) for more details.

## Global configuration

 * `TRAEFIK_DEBUG` Default `false`
 * `TRAEFIK_INSECURE_SKIP` Default `false`
 * `TRAEFIK_LOG_LEVEL` Default `INFO`
 * `TRAEFIK_DEFAULT_ENTRYPOINTS` Entrypoints to be used by frontends that do not specify any entrypoint. Each frontend can specify its own entrypoints.
 * `TRAEFIK_GRACE_TIMEOUT` Duration to give active requests a chance to finish before Traefik stops (`10s`)
 * `TRAEFIK_HEALTHCHECK_INTERVAL` Set the default health check interval (`30s`).
 * `TRAEFIK_READ_TIMEOUT` The maximum duration for reading the entire request, including the body.
 * `TRAEFIK_WRITE_TIMEOUT` The maximum duration before timing out writes of the response.
 * `TRAEFIK_IDLE_TIMEOUT` The maximum duration an idle (keep-alive) connection will remain idle before closing itself.
 * `TRAEFIK_RETRY` Number of attempts to reach backend service.

## Logs

### Access logs

By default the Traefik log is written to stdout in text format.

* `TRAEFIK_ACCESS_LOG` Enable logging. Default `false`
* `TRAEFIK_ACCESS_FORMAT` Logs format, e.g. `json`
* `TRAEFIK_ACCESS_PATH` Path to log files.

## Entrypoints

### http

* `TRAEFIK_HTTP_COMPRESSION` Default `true`
* `TRAEFIK_HTTP_ADDRESS`
* `TRAEFIK_HTTP_PORT` Default `80`

### https

 * `TRAEFIK_HTTPS_COMPRESSION` Default `true`
 * `TRAEFIK_HTTPS_ENABLE` Default `false`
 * `TRAEFIK_HTTPS_ADDRESS`
 * `TRAEFIK_HTTPS_PORT` Default `443`
 * `TRAEFIK_HTTPS_CERT` Certificate file, e.g. `examples/traefik.crt`
 * `TRAEFIK_HTTPS_KEY` Certificate key, e.g. `examples/traefik.key`

### ping

Heath check endpoint, responds without authentication to `/ping`.

 * `TRAEFIK_PING_ENABLE` Default `true`
 * `TRAEFIK_PING_PORT` If variable not defined, `$PORT0` will be used.

### API

Former `web.admin` interface.

 * `TRAEFIK_API_ENABLE` Enable API entrypoint
 * `TRAEFIK_API_PORT` If variable not defined, `$PORT1` will be used.
 * `TRAEFIK_API_DASHBOARD` Default `true`
 * `TRAEFIK_API_DEBUG` This will install HTTP handlers to expose Go expvars under /debug/vars and pprof profiling. Default `false`.

## Custom configuration

Appends custom configuration to generated `traefik.toml` config.

 * `TRAEFIK_FILE_NAME` Default `rules.toml`
 * `TRAEFIK_FILE_WATCH` Default `true`

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
 * `TRAEFIK_MESOS_ZK_TIMEOUT` ZooKeeper timeout (in seconds).
 * `TRAEFIK_MESOS_REFRESH` Polling interval (in seconds).
 * `TRAEFIK_MESOS_IP_SOURCES` IP sources (e.g. host, docker, mesos, netinfo).
 * `TRAEFIK_MESOS_TIMEOUT` HTTP Timeout (in seconds).
 * `TRAEFIK_MESOS_GROUPS_AS_SUBDOMAINS` Convert Mesos groups to subdomains. Default `false`

### Kubernetess

 * `TRAEFIK_K8S_ENABLE` Default `false`
 * `TRAEFIK_K8S_ENDPOINT` Kubernetes server endpoint.
 * `TRAEFIK_K8S_TOKEN` Bearer token used for the Kubernetes client configuration.
 * `TRAEFIK_K8S_CA` Path to the certificate authority file.
 * `TRAEFIK_K8S_NAMESPACES` Comma-separated namespaces to watch. e.g. `"\"default\",\"production\""`
 * `TRAEFIK_K8S_LABELSELECTOR` Ingress label selector to filter Ingress objects that should be processed. e.g. `"A and not B"`
 * `TRAEFIK_K8S_FILENAME` Override default configuration template.
 * `TRAEFIK_K8S_INGRESS_CLASS` Value of `kubernetes.io/ingress.class` annotation that identifies Ingress objects to be processed.
 * `TRAEFIK_K8S_DISABLE_PASS_HOST_HEADERS` Disable PassHost Headers.
 * `TRAEFIK_K8S_ENABLE_PASS_TLS_CERT` Enable PassTLSCert Headers.

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

## Let's Encrypt

 * `TRAEFIK_ACME_ENABLE` Certificates from Let's Encrypt. Default `false`
 * `TRAEFIK_ACME_EMAIL`
 * `TRAEFIK_ACME_ENTRYPOINT` Default `https`.
 * `TRAEFIK_ACME_STORAGE` File or key used for certificates storage.
 * `TRAEFIK_ACME_ONHOSTRULE` Default `false`
 * `TRAEFIK_ACME_CASERVER` Default `https://acme-v01.api.letsencrypt.org/directory`

## Metrics

* `TRAEFIK_STATISTICS_RECENT_ERRORS` Number of recent errors logged. Default `10`.

### DataDog

* `TRAEFIK_DATADOG_ADDRESS` Enables sending metrics to DataDog, e.g. `localhost:8125`
* `TRAEFIK_DATADOG_PUSHINTERVAL` Default `10s`

### InfluxDB

* `TRAEFIK_INFLUXDB_ADDRESS` Enables sending metrics to InfluxDB, e.g. `localhost:8089`
* `TRAEFIK_INFLUXDB_PUSHINTERVAL` Default `10s`

### Prometheus

Will be enabled when `TRAEFIK_PROMETHEUS_ENTRYPOINT` is set, e.g. to `api`.

 * `TRAEFIK_PROMETHEUS_ENTRYPOINT`
 * `TRAEFIK_PROMETHEUS_BUCKETS` Comma separated values. Default `0.1,0.3,1.2,5.0`

### StatsD

* `TRAEFIK_STATSD_ADDRESS` Enables sending metrics to StatsD, e.g. `localhost:8125`
* `TRAEFIK_STATSD_PUSHINTERVAL` Default `10s`


## Tracing

* `TRAEFIK_TRACING_BACKEND` Backend name used to send tracing data, either `jaeger` or `zipkin`
* `TRAEFIK_TRACING_SERVICE` Service name used in tracing backend, default: `traefik`
* `TRAEFIK_TRACING_SPANLIMIT` Span name limit allows for name truncation in case of very long Frontend/Backend names

### Jaeger

* `TRAEFIK_TRACING_JAEGER_SERVER` Sampling Server URL is the address of jaeger-agent's HTTP sampling server
* `TRAEFIK_TRACING_JAEGER_SAMPLINGTYPE` Sampling Type specifies the type of the sampler: `const`, `probabilistic`, `rateLimiting`
* `TRAEFIK_TRACING_JAEGER_SAMPLINGPARAM` Sampling Param is a value passed to the sampler
* `TRAEFIK_TRACING_JAEGER_AGENTADDRESS` Local Agent Host Port instructs reporter to send spans to jaeger-agent at this address

### Zipkin

* `TRAEFIK_TRACING_ZIPKING_ENDPOINT` Zipking HTTP endpoint used to send data
* `TRAEFIK_TRACING_ZIPKING_DEBUG` Enable Zipkin debug, default: `false`
* `TRAEFIK_TRACING_ZIPKING_SAMESPAN` Use ZipKin SameSpan RPC style traces
* `TRAEFIK_TRACING_ZIPKING_ID128` Use ZipKin 128 bit root span IDs