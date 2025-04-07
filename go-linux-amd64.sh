#!/bin/sh

VERSION=1.24.2
wget https://golang.org/dl/go$VERSION.linux-amd64.tar.gz
rm -rf /usr/local/go && tar -C /usr/local -xzf go$VERSION.linux-amd64.tar.gz
rm go$VERSION.tar.gz
echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.zshrc
echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.bashrc
echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.profile
