#!/bin/sh
# Ensures /data is writable by the node user when a volume is mounted (e.g. Railway).
# Run as root; then exec the main process as node.
set -e
if [ -d /data ]; then
  mkdir -p /data/.openclaw /data/workspace
  chown -R node:node /data
fi
exec gosu node "$@"
