#! /bin/bash

arch=$(uname -m)
root=$(dirname $(realpath $0))
sysdrv=$(dirname $(dirname $(dirname ${root})))/sysdrv
alpine_version=3.20
 
# 非ARM指令集需要开启虚拟化
if [[ ! "${arch}" == arm* ]] ; then
  docker run --rm --privileged multiarch/qemu-user-static --reset --persistent yes
fi

# 创建 rootfs
docker run --rm -it --platform linux/arm/v7 -v ${root}:/home alpine:${alpine_version} /bin/ash /home/build_in_docker.sh

# 切分 rootfs
cd ${root} && split -b 50m -d rootfs_alpine.tar.gz rootfs_alpine.tar.gz
rm -rf ${root}/rootfs_alpine.tar.gz

# 复制 rootfs
rm -rf ${sysdrv}/tools/board/rootfs_alpine.tar.gz*
cp ${root}/rootfs_alpine.tar.gz* ${sysdrv}/tools/board
rm -rf ${root}/rootfs_alpine.tar.gz*

echo done!!!
