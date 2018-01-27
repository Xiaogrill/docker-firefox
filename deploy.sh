#!/bin/sh

INSTALL_PREFIX=/usr/local/bin

if [ `id -u` != 0 ]; then
  exec sudo `realpath $0` "$@"
fi

set -e

mkdir -p /root/docker/firefox || true

cp Dockerfile firefox /root/docker/firefox/

chown -R root:root /root/docker
chmod 600 /root/docker/firefox/Dockerfile
chmod 755 /root/docker/firefox/firefox

cp /root/docker/firefox/firefox $INSTALL_PREFIX/firefox

$INSTALL_PREFIX/firefox --build
