## Simple Varnish 5.2 image with NCSA logging
# Supported `Dockerfile` tags
* [`5.2`, `5.2-jessie`, `latest`](https://github.com/xsolve-pl/docker-varnish/blob/master/stretch/Dockerfile)
* [`5.2-alpine`](https://github.com/xsolve-pl/docker-varnish/blob/master/alpine/Dockerfile)

# Quick start

> Requires default VCL config file in /etc/varnish/default.vcl

```bash
docker run --volume=default.vcl:/etc/varnish/default.vcl xsolve/varnish
```

### Optional environment variables:
* VARNISH_NCSA_FORMAT - [varnishncsa](https://varnish-cache.org/docs/5.2/reference/varnishncsa.html#varnishncsa-1) log format, can be empty, default: `%h %l %u %t "%r" %s %b "%{Referer}i" "%{User-agent}i"`
* VARNISH_PORT - port for the server, default 80
* VARNISH_ADMIN_PORT - port for the admin module, default 81
* CONFIG_LOCATION - config file location, default `/etc/varnish/default.vcl`
* VARNISH_ADDITIONAL_RUN_PARAMS - additional parameters to run [varnishd](https://varnish-cache.org/docs/5.2/reference/varnishd.html), default is blank
 the varnish is started with command 
```bash
varnishd -a 0.0.0.0:${PORT} -T 0.0.0.0:${ADMIN_PORT} -f ${DEFAULT_CONFIG_FILE_LOCATION} ${ADDITIONAL_PARAMS}
```

### Full config example:
```bash
docker run --volume=default.vcl:/default.vcl -e CONFIG_LOCATION="/default.vcl" -e VARNISH_NCSA_FORMAT="%h %l %u [%{%FT%T%z}t] %{Varnish:side}x %{Varnish:hitmiss}x \"%r\" %s %b %D %{Varnish:time_firstbyte}x \"%{Referer}i\" \"%{User-agent}i\"" -e VARNISH_PORT=6081 -e VARNISH_ADMIN_PORT=6082 -e VARNISH_ADDITIONAL_RUN_PARAMS="-s malloc,5G" xsolve/varnish
```

### [Docker Hub](https://hub.docker.com/r/xsolve/varnish/)
