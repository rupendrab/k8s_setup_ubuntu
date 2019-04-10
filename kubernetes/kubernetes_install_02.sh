#!/bin/bash

if [ "$USER" != "root" ]
then
  echo "Must be run as root!"
  exit 1
fi

systemctl daemon-reload
systemctl restart kubelet
