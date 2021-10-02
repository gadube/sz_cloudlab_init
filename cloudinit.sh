#!/bin/bash

#Fix locale warnings
sudo localedef -c -f UTF-8 -i en_US en_US.UTF-8
export LC_ALL=en_US.UTF-8

#Install newer version of gcc
sudo yum install -y centos-release-scl
sudo yum install -y devtoolset-9

cd /users/gadube 
git clone https://github.com/szcompressor/vecSZ.git
sudo setfacl -R -m user:gadube:rwx vecSZ 
