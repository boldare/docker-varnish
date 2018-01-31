FROM alpine
LABEL Maintainers="krzysztof.ciszewski@xsolve.pl developers@xsolve.pl"

RUN apk update && \
    apk upgrade && \
    apk add varnish

COPY entrypoint.sh /entrypoint.sh
CMD ["./entrypoint.sh"]
