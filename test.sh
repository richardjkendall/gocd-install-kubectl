#!/bin/bash

export PATH=$PATH:~/.local/bin/kubectl

kubectl version --client

kubectl --token=$K8S_TOKEN get pods
