#!/bin/bash

if [ "$USER" != "root" ]
then
  echo "Must be run as root!"
  exit 1
fi

kubeadm init --pod-network-cidr=10.244.0.0/16
sleep 10

cd $(dirname $0)
./setup_kubectl.sh

success=1
while [ $success -ne 0 ]
do
  kubectl apply -f https://docs.projectcalico.org/v3.3/getting-started/kubernetes/installation/hosted/canal/rbac.yaml
  success=$?
  sleep 5
done

success=1
while [ $success -ne 0 ]
do
  kubectl apply -f https://docs.projectcalico.org/v3.3/getting-started/kubernetes/installation/hosted/canal/canal.yaml
  success=$?
  sleep 5
done

