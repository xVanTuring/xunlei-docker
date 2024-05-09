#!/bin/sh

set -e # Exit immediately if a command exits with a non-zero status.
set -u # Treat unset variables as an error.

# Make sure mandatory directories exist.
mkdir -p /downloads
mkdir -p /config/xdg/data

# Take ownership of the config directory content.
chown -R $USER_ID:$GROUP_ID /downloads
chown -R $USER_ID:$GROUP_ID /config

