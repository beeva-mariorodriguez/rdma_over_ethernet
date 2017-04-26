#!/bin/bash
sudo apt update
# install mainline kernel
wget "http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.10.12/linux-headers-4.10.12-041012_4.10.12-041012.201704210512_all.deb"
wget "http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.10.12/linux-headers-4.10.12-041012-generic_4.10.12-041012.201704210512_amd64.deb"
wget "http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.10.12/linux-image-4.10.12-041012-generic_4.10.12-041012.201704210512_amd64.deb"
sudo dpkg -i *.deb
# install librxe dependencies
sudo apt install -y build-essential libibverbs-dev libswitch-perl librdmacm-dev ibverbs-utils automake rdmacm-utils ibutils
sudo cp rdma_user_rxe.h /usr/include/rdma
# compile and install librxe-dev
git clone "https://github.com/SoftRoCE/librxe-dev.git"
cd librxe-dev
./configure  --sysconfdir=/etc --prefix=/usr
make
sudo make install

echo "*** reboot ***"

