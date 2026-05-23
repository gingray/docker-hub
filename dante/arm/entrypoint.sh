#!/bin/sh
set -e

if [ -z "$PROXY_USER" ] || [ -z "$PROXY_PASS" ]; then
    echo "ERROR: PROXY_USER and PROXY_PASS environment variables are required" >&2
    exit 1
fi

if ! id "$PROXY_USER" >/dev/null 2>&1; then
    adduser -D -H -s /sbin/nologin "$PROXY_USER"
fi

printf '%s:%s' "$PROXY_USER" "$PROXY_PASS" | chpasswd

exec /usr/sbin/sockd -f /etc/sockd.conf
