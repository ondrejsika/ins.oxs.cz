#!/bin/sh
#
# Server Setup

cd && \
  apt update && \
  apt purge -y nano && \
  apt install -y vim mc htop git sudo curl wget gnupg apt-transport-https && \
  mkdir -p .ssh && \
  curl -o - https://github.com/ondrejsika.keys >> ~/.ssh/authorized_keys
