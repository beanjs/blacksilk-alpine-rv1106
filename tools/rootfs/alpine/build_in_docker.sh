#! /bin/sh

root=$(dirname $(realpath $0))

# 切换源
sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

# 安装基础包
apk update
apk add --no-cache openrc tzdata agetty alpine-conf util-linux util-linux-misc mtd-utils-ubi e2fsprogs e2fsprogs-extra
apk add --no-cache bash bash-completion openntpd openssh
# apk add --no-cache apk-tools zfs wpa_supplicant gzip
apk cache clean

# 设置root密码
echo root:password|chpasswd

# 设置时区
cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
echo "Asia/Shanghai" >  /etc/timezone

# 复制启动项
cp ${root}/patch/etc/init.d/* /etc/init.d

# 添加启动项
rc-update add cgroups boot
rc-update add devfs boot
rc-update add procfs boot
rc-update add sysfs boot
rc-update add linkmount default
rc-update add networking default
rc-update add sshd default
rc-update add openntpd default

# 创建导出目录
mkdir -p ${root}/.rootfs && rm -rf ${root}/.rootfs/*

# 准备文件系统
for d in bin etc lib sbin usr var; do tar c "$d" | tar x -C ${root}/.rootfs; done
for dir in dev opt proc root run sys tmp media userdata oem; do mkdir -p ${root}/.rootfs/${dir}; done

# 合并修改项
echo merge patch
cp -rf ${root}/patch/* ${root}/.rootfs
rm -rf ${root}/.rootfs/var/cache/apk/*

# 导出文件系统
echo export rootfs
cd ${root}/.rootfs/ && tar czf rootfs_alpine.tar.gz * && mv rootfs_alpine.tar.gz ..
rm -rf ${root}/.rootfs

# 退出
exit
