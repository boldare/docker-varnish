#!/usr/bin/env bash

ADDITIONAL_PARAMS=""
PORT="6081"
ADMIN_PORT="6082"
NCSA_FORMAT='%h %l %u [%{%FT%T%z}t] %{Varnish:side}x %{Varnish:hitmiss}x "%r" %s %b %D %{Varnish:time_firstbyte}x "%{Referer}i" "%{User-agent}i"'
if [ -n "$VARNISH_NCSA_FORMAT" ]
then
    NCSA_FORMAT=$VARNISH_NCSA_FORMAT
fi
if [ -n "$VARNISH_ADDITIONAL_RUN_PARAMS" ]
then
    ADDITIONAL_PARAMS=$VARNISH_ADDITIONAL_RUN_PARAMS
fi
if [ -n "$VARNISH_PORT" ]
then
    PORT=$VARNISH_PORT
fi
if [ -n "$VARNISH_ADMIN_PORT" ]
then
    ADMIN_PORT=$VARNISH_ADMIN_PORT
fi
varnishd -a 0.0.0.0:${PORT} -T 0.0.0.0:${ADMIN_PORT} -f /etc/varnish/default.vcl ${ADDITIONAL_PARAMS}
varnishncsa -b -c -F "${NCSA_FORMAT}"
