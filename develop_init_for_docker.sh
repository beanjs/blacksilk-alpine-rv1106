#! /bin/bash

sed -i 's@//.*archive.ubuntu.com@//mirrors.ustc.edu.cn@g' /etc/apt/sources.list
sed -i 's/security.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list

apt update
apt install sudo


# 大文件切割
# split -b 50m -d rootfs_ubuntu.tar.gz rootfs_ubuntu.tar.gz