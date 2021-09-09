#!/bin/sh

VERSION=v0.1.0 && \
OS=linux && \
ARCH=amd64 && \
BIN=install-slu && \
curl -L https://github.com/sikalabs/${BIN}/releases/download/${VERSION}/${BIN}_${VERSION}_${OS}_${ARCH}.tar.gz -o ${BIN}_${VERSION}_${OS}_${ARCH}.tar.gz && \
tar -xvzf ${BIN}_${VERSION}_${OS}_${ARCH}.tar.gz && \
rm ${BIN}_${VERSION}_${OS}_${ARCH}.tar.gz && \
mv ${BIN} /usr/local/bin/

install-slu install
