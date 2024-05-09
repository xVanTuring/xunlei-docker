#!/bin/sh

set -e # Exit immediately if a command exits with a non-zero status.
set -u # Treat unset variables as an error.

export HOME=/config
exec /opt/apps/com.xunlei.download/files/start.sh
