#!/bin/bash

if [ "$USER" != "root" ]
then
  echo "Must be run as root!"
  exit 1
fi

echo "Step 1"
apt-get update -y && apt-get install -y apt-transport-https curl

echo "Step 2"
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -

echo "Step 2-a"
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF

echo "Step 3"
apt-get update -y

echo "Step 4"
apt-get install -y kubelet kubeadm kubectl

echo "Step 5"
apt-mark hold kubelet kubeadm kubectl
