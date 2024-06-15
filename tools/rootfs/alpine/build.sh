#! /bin/sh

arch=$(uname -m)
root=$(dirname $(realpath $0))
sysdrv=$(dirname $(dirname $(dirname ${root})))/sysdrv
 
# 非ARM指令集需要开启虚拟化
if [[ ! "${arch}" == arm* ]] ; then
  docker run --rm --privileged multiarch/qemu-user-static --reset --persistent yes
fi

# 创建 rootfs
docker run --rm -it --platform linux/arm/v7 -v ${root}:/home alpine:3.19 /bin/ash /home/build_in_docker.sh

# 切分 rootfs
cd ${root}/.rootfs && split -b 50m -d rootfs_alpine.tar.gz rootfs_alpine.tar.gz
rm -rf ${root}/.rootfs/rootfs_alpine.tar.gz

# 复制 rootfs
rm -rf ${sysdrv}/tools/board/rootfs_alpine.tar.gz*
cp ${root}/.rootfs/rootfs_alpine.tar.gz* ${sysdrv}/tools/board

# 删除缓存
rm -rf ${root}/.rootfs

echo done!!!