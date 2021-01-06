#Autoremove preexisting oneAPI repo installation
sudo -E yum autoremove intel-hpckit intel-basekit

#Set up oneAPI base repository
tee > /tmp/oneAPI.repo << EOF
[oneAPI]
name=Intel(R) oneAPI repository
baseurl=https://yum.repos.intel.com/oneapi
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://yum.repos.intel.com/intel-gpg-keys/GPG-PUB-KEY-INTEL-SW-PRODUCTS.PUB
EOF

#Move new oneAPI.repo to YUM repo config directory
sudo mv /tmp/oneAPI.repo /etc/yum.repos.d

#Install only Vtune from oneAPI repo
sudo yum install intel-oneapi-vtune

