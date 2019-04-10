#!/bin/bash

if [ "$USER" != "root" ]
then
  echo "Must be run as root!"
  exit 1
fi

kubeadm init --pod-network-cidr=10.244.0.0/16

kubectl apply -f https://docs.projectcalico.org/v3.3/getting-started/kubernetes/installation/hosted/canal/rbac.yaml
kubectl apply -f https://docs.projectcalico.org/v3.3/getting-started/kubernetes/installation/hosted/canal/canal.yaml
