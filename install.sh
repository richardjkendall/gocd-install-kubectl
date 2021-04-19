#!/bin/bash

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"

check_output=`echo "$(<kubectl.sha256) kubectl" | sha256sum --check`
okay_string="kubectl: OK"

if [ "$check_output" == "$okay_string" ]; then
  echo "OKAY: downloaded file matches the expected checksum"
  mkdir -p ~/.local/bin/kubectl
  mv ./kubectl ~/.local/bin/kubectl
  export PATH=$PATH:~/.local/bin/kubectl
else
  echo "ERROR: checksum does not match"
  exit 1
fi
