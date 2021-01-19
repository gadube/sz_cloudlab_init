# Create folder and download benchmarks to benchmark folder   
[ -d "~/benchmarks" ] || mkdir ~/benchmarks
wget -O ~/benchmarks/dgemm.tar.gz https://www.lanl.gov/projects/crossroads/_assets/docs/micro/mtdgemm-crossroads-v1.0.0.tgz
wget -O ~/benchmarks/stream.tar.gz https://www.lanl.gov/projects/crossroads/_assets/docs/micro/stream-bench-crossroads-v1.0.0.tgz
wget -O ~/benchmarks/openblas.tar.gz https://github.com/xianyi/OpenBLAS/releases/download/v0.3.13/OpenBLAS-0.3.13.tar.gz
cd ~/benchmarks

#Decompress files
[ -d "~/benchmarks/dgemm" ] || mkdir ~/benchmarks/dgemm && tar -xvf ~/benchmarks/dgemm.tar.gz -C ~/benchmarks/dgemm
[ -d "~/benchmarks/stream" ] || mkdir ~/benchmarks/stream && tar -xvf ~/benchmarks/stream.tar.gz -C ~/benchmarks/stream
[ -d "~/benchmarks/openblas" ] || mkdir ~/benchmarks/openblas && tar -xvf ~/benchmarks/openblas.tar.gz -C ~/benchmarks/openblas

#build OpenBLAS files
cd ~/benchmarks/openblas/*
make
sudo make install

#build stream files
cd ~/benchmarks/stream/*
make

#build dgemm files
cd ~/benchmarks/dgemm/*/src
sed -i 's/-o/-I\/opt\/OpenBLAS\/include \$(LDFLAGS) -o/g' Makefile
export OPENBLAS_ROOT="/opt/OpenBLAS"
make
