#!/bin/sh

set -e

if [ -d /tmp/.ssh ] && [ -f /tmp/.ssh/id_rsa.pub ] && [ -f /tmp/.ssh/id_rsa ]; then
  cp -R /tmp/.ssh /root/.ssh
  chmod 700 /root/.ssh
  chmod 644 /root/.ssh/known_hosts
  chmod 644 /root/.ssh/id_rsa.pub
  chmod 600 /root/.ssh/id_rsa
fi

if [ -z "$(ls -A /akvo-flow-server-config)" ] && [ -f /root/.ssh/id_rsa.pub ]; then
  git clone git@github.com:akvo/akvo-flow-server-config.git /akvo-flow-server-config
fi

exec "$@"
