#!/bin/sh

VERSION=$(curl -sL "https://go.dev/VERSION?m=text" | head -1 | sed 's/go//')
wget https://golang.org/dl/go$VERSION.linux-amd64.tar.gz
rm -rf /usr/local/go && tar -C /usr/local -xzf go$VERSION.linux-amd64.tar.gz
rm go$VERSION.linux-amd64.tar.gz
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.zshrc
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.profile
