# syntax=docker/dockerfile:1
FROM alpine:3.20

RUN apk add --no-cache dante-server shadow

COPY sockd.conf /etc/sockd.conf
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 1080

ENTRYPOINT ["/entrypoint.sh"]
