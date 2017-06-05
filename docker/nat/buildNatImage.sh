#!/bin/bash

if [ "$#" -lt 1 ] ; then
    echo "Error to start: usage buildNatImage.sh <image_name>" ;
    exit;
fi

image_name=$1
src_dir="../../configuration-agent"
dst_dir="nat-agent"

mkdir -p $dst_dir

# Copy the nat agent
cp -r $src_dir/* $dst_dir/
rm -r $dst_dir/dhcp
rm -r $dst_dir/firewall
mkdir -p $dst_dir/config
echo $'[settings]\nvnf = nat' >> $dst_dir/config/default-config.ini

sudo docker build -t $image_name .

sudo rm -r tmp
