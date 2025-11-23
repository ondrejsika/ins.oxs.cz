#!/bin/sh

# Check if running Debian
if [ ! -f /etc/os-release ]; then
    echo "Error: /etc/os-release not found. This script only supports Debian."
    exit 1
fi

. /etc/os-release

if [ "$ID" != "debian" ]; then
    echo "Error: This script only supports Debian. Detected OS: $ID"
    exit 1
fi

# Get Debian version
VERSION_ID=${VERSION_ID:-0}

echo "Detected Debian version: $VERSION_ID"

# Use docker13.sh for Debian 13 and newer, docker12.sh for 12 and older
if [ "$VERSION_ID" -ge 13 ]; then
    echo "Using docker13.sh for Debian $VERSION_ID..."
    curl -fsSL https://ins.oxs.cz/docker13.sh | sudo sh
else
    echo "Using docker12.sh for Debian $VERSION_ID..."
    curl -fsSL https://ins.oxs.cz/docker12.sh | sudo sh
fi
