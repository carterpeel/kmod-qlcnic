#!/bin/bash

qlnicdrivers () {
    
    cd ~
    
    setenforce 0
    mkdir qlnic
    cd qlnic/
    
    wget https://github.com/liamalxd/kmod-qlcnic/blob/main/qlcnic_el8_3.ko?raw=true
    mkdir -p /lib/modules/4.18.0-240.el8.x86_64/extra/qlcnic/
    mv 'qlcnic_el8_3.ko?raw=true' qlcnic.ko
    cp qlcnic.ko /lib/modules/4.18.0-240.el8.x86_64/extra/qlcnic/
    echo "install qlcnic insmod /lib/modules/4.18.0-240.el8.x86_64/extra/qlcnic/qlcnic.ko" > /etc/modprobe.d/qlcnic.conf
    echo "qlcnic" > /etc/modules-load.d/qlcnic.conf
    modprobe qlcnic
    
}

qlnicdrivers
