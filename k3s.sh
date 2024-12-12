#!/bin/sh

if ! command -v slu &> /dev/null; then
    echo "slu not found. Installing..."
    curl -fsSL https://raw.githubusercontent.com/sikalabs/slu/master/install.sh | sh
else
    echo "slu is already installed."
fi

slu install-bin kubectl
slu install-bin helm
slu install-bin k9s

curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="server --disable=traefik" sh -

mkdir -p ~/.kube
cp /etc/rancher/k3s/k3s.yaml ~/.kube/config
