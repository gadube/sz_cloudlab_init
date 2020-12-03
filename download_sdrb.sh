#!/bin/bash

sudo rm -rf /mydata/nyx
sudo mkdir /mydata/nyx
sudo rm -rf /mydata/hacc
sudo mkdir /mydata/hacc
sudo rm -rf /mydata/cesm
sudo mkdir /mydata/cesm
sudo rm -rf /mydata/qmc
sudo mkdir /mydata/qmc
sudo rm -rf /mydata/exafel
sudo mkdir /mydata/exafel
sudo rm -rf /mydata/hurr
sudo mkdir /mydata/hurr

cd /mydata
wget -bqc -O hacc.tar.gz https://97235036-3749-11e7-bcdc-22000b9a448b.e.globus.org/ds131.2/Data-Reduction-Repo/raw-data/EXASKY/HACC/EXASKY-HACC-data-medium-size.tar.gz
sudo tar -xvf hacc.tar.gz -C /mydata/hacc

wget -bqc -O nyx.tar.gz https://97235036-3749-11e7-bcdc-22000b9a448b.e.globus.org/ds131.2/Data-Reduction-Repo/raw-data/EXASKY/NYX/SDRBENCH-EXASKY-NYX-512x512x512.tar.gz
sudo tar -xvf nyx.tar.gz -C /mydata/nyx

wget -bqc -O cesm.tar.gz https://97235036-3749-11e7-bcdc-22000b9a448b.e.globus.org/ds131.2/Data-Reduction-Repo/raw-data/CESM-ATM/SDRBENCH-CESM-ATM-1800x3600.tar.gz
sudo tar -xvf cesm.tar.gz -C /mydata/cesm

wget -bqc -O qmc.tar.gz https://97235036-3749-11e7-bcdc-22000b9a448b.e.globus.org/ds131.2/Data-Reduction-Repo/raw-data/QMCPack/SDRBENCH-QMCPack.tar.gz
sudo tar -xvf qmc.tar.gz -C /mydata/qmc

wget -bqc -O exafel.tar.gz https://97235036-3749-11e7-bcdc-22000b9a448b.e.globus.org/ds131.2/Data-Reduction-Repo/raw-data/EXAFEL/SDRBENCH-EXAFEL-10x32x185x388.tar.gz
sudo tar -xvf exafel.tar.gz -C /mydata/exafel

wget -bqc -O hurricane.tar.gz https://97235036-3749-11e7-bcdc-22000b9a448b.e.globus.org/ds131.2/Data-Reduction-Repo/raw-data/Hurricane-ISABEL/SDRBENCH-Hurricane-ISABEL-100x500x500.tar.gz
sudo tar -xvf hurricane.tar.gz

sudo setfacl -R -m user:gadube:rwx /mydata
