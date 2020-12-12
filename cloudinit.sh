#!/bin/bash

#Fix locale warnings
sudo localedef -c -f UTF-8 -i en_US en_US.UTF-8
export LC_ALL=en_US.UTF-8

#Install PAPI
git clone https://bitbucket.com/icl/papi.git /users/gadube/papi
cd /users/gadube/papi/src
if [ ! -d "/path/to/dir" ]
then
	echo "Creating $HOME/local"
	mkdir $HOME/local
fi
./configure
make
make install
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/papi/src
sudo sh -c 'echo -1 >/proc/sys/kernel/perf_event_paranoid'

#Install newer version of gcc
sudo yum install -y centos-release-scl
sudo yum install -y devtoolset-9
#scl enable devtoolset-9 bash
#gcc --version


#Install CUDA
#wget https://developer.download.nvidia.com/compute/cuda/repos/rhel7/x86_64/cuda-repo-rhel7-10.0.130-1.x86_64.rpm
#rpm -i cuda-repo-*.rpm
#sudo yum install -y cuda
#export PATH=/usr/local/cuda/bin:$PATH
#export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH

cd $HOME
git clone https://github.com/gadube/cuSZ.git
