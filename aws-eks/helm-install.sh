#!/bin/bash

#### check your specific version from page #######
######### https://github.com/helm/helm/releases ###########

wget https://get.helm.sh/helm-v4.1.1-linux-amd64.tar.gz
tar -xvf helm-v4.1.1-linux-amd64.tar.gz
cp linux-amd64/helm /usr/local/bin/ 
